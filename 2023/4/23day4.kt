import java.io.File
import kotlin.math.pow

fun main() {
    val s = DayFour2023("2023/4/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayFour2023(private val path: String) {

    private val regex = Regex("(\\d+): +(.+) \\| +(.+)")

    fun partOne(): Int {

        return File(path).readLines().sumOf {
            val (_, winning, chosen) = ticketOf(regex.find(it)!!.groupValues.toList())

            calcWin(winning, chosen).let { s ->
                if (s != 0) (2.0.pow(s - 1).toInt()) else 0
            }
        }
    }

    fun partTwo(): Int {

        val games = File(path).readLines()
        val map: MutableMap<Int, Int> = IntRange(1,games.size).toList().associateWith { 1 }.toMutableMap()
        games.forEach {

            val (id, winning, chosen) = ticketOf(regex.find(it)!!.groupValues.toList())

            (1..calcWin(winning, chosen)).forEach { x -> map[id+x] = map[id+x]!! + map[id]!! }
        }
        return map.values.sum()
    }

    private fun calcWin(w: List<Int>, c: List<Int>): Int = c.intersect(w.toSet()).size

    private fun ticketOf(t: List<String>): Triple<Int, List<Int>, List<Int>> = Triple(
            t[1].toInt(),
            t[2].split(Regex(" +")).map { it.toInt() },
            t[3].split(Regex(" +")).map { it.toInt() }
        )

}
