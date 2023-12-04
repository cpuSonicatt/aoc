import java.io.File
import kotlin.math.pow
import kotlin.time.measureTime

fun main() {

    val s = DayFour2023("2023/4/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayFour2023(private val path: String) {

    fun partOne(): Int {
        return File(path).readLines().sumOf {
            val (winning, chosen) = Regex("Card +\\d+: (.+)")
                .find(it)!!
                .groups[1]!!.value
                .split(" | ")
                .map { n ->
                    Regex("\\d+").findAll(n).toList().map { m ->
                        m.value
                    }
                }.toList()

            val winners = chosen.intersect(winning.toSet())
            if (winners.isNotEmpty()) (2.0.pow(winners.size - 1).toInt()) else 0

        }
    }

    private var total = 0

    // This takes ~40 seconds and is bad.
    fun partTwo(): Int {

        val games: MutableList<String> = File(path).readLines().toMutableList()
        process(games, games)
        return total
    }

    private fun process(g: MutableList<String>, l: MutableList<String>) {
        if (l.isNotEmpty()) {
            total += l.size
        }
        l.forEach {
            val (idl, winning, chosen) = Regex("(\\d+: .+)")
                .find(it)!!
                .groups[1]!!.value
                .split(Regex("[:|]"))
                .map { n ->
                    Regex("\\d+").findAll(n).toList().map { m ->
                        m.value
                    }
                }
            val i = idl[0].toInt()
            val amnt = calcWin(winning, chosen)
            process(g, g.subList(i, i + amnt))
        }
    }

    private fun calcWin(w: List<String>, c: List<String>): Int = c.intersect(w.toSet()).size

}
