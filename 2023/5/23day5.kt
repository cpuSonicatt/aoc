import java.io.File
import java.util.*

fun main() {
    val s = DayFive2023("2023/5/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayFive2023(private val path: String) {

    fun partOne(): Long {
        val info = File(path).readText().split(Regex("\\r?\\n\\r?\\n")).map { it.replace(Regex("\\r?\\n"), "  ") }
        val seeds: List<Long> = Regex("\\d+").findAll(info[0]).toList().map { it.value.toLong() }

        val res: MutableList<MutableMap<Long, Long>> = mutableListOf()

        info.drop(1).forEach {
            println(it)
            val map: MutableMap<Long, Long> = mutableMapOf()
            it.split("  ").drop(1).forEach { sam ->
                val (d, s, l) = sam.split(" ").map { n -> n.toLong() }
                val dr = (d..< d+l).toList()
                val sr = (s..< s+l).toList()
                (0..<l).forEach { i ->
                    map[sr[i.toInt()]] = dr[i.toInt()]
                }
            }
            res.add(map)
        }

        val locs: MutableList<Long> = mutableListOf()
        seeds.forEach { seed ->
            var curr = seed
            res.forEach {
                curr = it[curr] ?: curr
            }
            locs.add(curr)
        }

        return locs.min()
    }

    fun partTwo(): Long {
        File(path).readLines()
        return -1
    }

}

