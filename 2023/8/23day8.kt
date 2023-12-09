import java.io.File

fun main() {

    val s = DayEight2023("2023/8/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayEight2023(private val path: String) {

    fun partOne(): Int {
        val input = File(path).readLines().filter { it != "" }
        val dirs = input[0].split("").filter { it != "" }
        val nodes: MutableMap<String, Pair<String, String>> = mutableMapOf()

        input.drop(1).map {
            val info = Regex("[A-Z]{3}").findAll(it).toList().map { x -> x.value }
            nodes[info[0]] = Pair(info[1], info[2])
        }

        var steps = 0
        var curr = "AAA"
        while (curr != "ZZZ") {
            curr = when (dirs[steps % dirs.size]) {
                "L" -> nodes[curr]!!.first
                "R" -> nodes[curr]!!.second
                else -> "000"
            }
            steps += 1
        }

        return steps
    }

    fun partTwo(): Long {
        val input = File(path).readLines().filter { it != "" }
        val dirs = input[0].split("").filter { it != "" }
        val nodes: MutableMap<String, Pair<String, String>> = mutableMapOf()

        input.drop(1).map {
            val info = Regex("[A-Z0-9]{3}").findAll(it).toList().map { x -> x.value }
            nodes[info[0]] = Pair(info[1], info[2])
        }

        val currs = nodes.filter { it.key[2] == 'A' }
        val zsteps: MutableList<Int> = mutableListOf()

        currs.forEach { curr ->
            var steps = 0
            var x: Pair<String, Pair<String, String>> = curr.toPair()
            while (x.first[2] != 'Z') {
                x = when (dirs[steps % dirs.size]) {
                    "L" -> Pair(nodes[x.first]!!.first, nodes[nodes[x.first]!!.first]!!)
                    "R" -> Pair(nodes[x.first]!!.second, nodes[nodes[x.first]!!.second]!!)
                    else -> Pair("???", Pair("???", "???"))
                }
                steps += 1
            }
            zsteps.add(steps)
        }

        return zsteps.map{it.toLong()}.lcm()
    }


    private fun List<Long>.lcm(): Long {
        var r = this[0]
        for (i in 1..< this.size) {
            r = findLCM(r, this[i])
        }
        return r
    }

    private fun findLCM(a: Long, b: Long): Long {
        val larger = listOf(a, b).max()
        val maxLCM = a * b
        var lcm = larger
        while (lcm <= maxLCM) {
            if (lcm % a == 0L && lcm % b == 0L) {
                return lcm
            }
            lcm += larger
        }
        return maxLCM
    }
}
