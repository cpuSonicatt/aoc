import java.io.File
fun main() {
    val s = DaySix2023("2023/6/i")
    println(s.partOne())
    println(s.partTwo())
}

class DaySix2023(private val path: String) {

    fun partOne(): Int {
        val data = File(path).readLines()
        val times: List<Int> = Regex("(\\d+)").findAll(data[0]).toList().map { it.value.toInt() }
        val dists: List<Int> = Regex("(\\d+)").findAll(data[1]).toList().map { it.value.toInt() }

        var res = 1
        times.indices.forEach {
            val wins: MutableList<Int> = mutableListOf()
            (0..times[it]).forEach { i ->
                val time = times[it]
                val held = i
                if ((time - held) * held > dists[it]) {
                    wins.add(0)
                }
            }
            res *= wins.size
        }
        return res
    }

    fun partTwo(): Int {
        val data = File(path).readLines()
        val time = Regex("(\\d+)").findAll(data[0]).toList().joinToString("") { it.value }.toLong()
        val dist = Regex("(\\d+)").findAll(data[1]).toList().joinToString("") { it.value }.toLong()

        val wins: MutableList<Int> = mutableListOf()
        (0..time).forEach { i ->
            if ((time - i) * i > dist) {
                wins.add(0)
            }
        }
        return wins.size

    }

}
