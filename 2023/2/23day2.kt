import java.io.File

fun main() {

    val s = DayTwo2023("2023/2/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayTwo2023(private val path: String) {

    fun partOne(): Int {
        val games: List<String> = File(path).readLines()
        var legal = 0

        games.forEach {
            val (gameNum, cubes) = Regex("Game (\\d+): (\\d+ .+)").find(it)!!.destructured
            if (!cubes.split("; ").map { r ->
                    r.split(", ").map { cu ->
                        val (n, c) = cu.split(" ")
                        c == "red" && n.toInt() <= 12
                                || c == "green" && n.toInt() <= 13
                                || c == "blue" && n.toInt() <= 14
                    }
                }.flatten().any{x -> !x}) legal += gameNum.toInt()
        }
        return legal
    }

    fun partTwo(): Int {
        val games: List<String> = File(path).readLines()

        var total = 0

        games.forEach {
            var mR = 0
            var mG = 0
            var mB = 0
            val (gameNum, cubes) = Regex("Game (\\d+): (\\d+ .+)").find(it)!!.destructured
            var x = cubes.split("; ").map { r ->
                r.split(", ").map { cu ->
                    val (n, c) = cu.split(" ")
                    when (c) {
                        "red" -> if (mR < n.toInt()) mR = n.toInt()
                        "green" -> if (mG < n.toInt()) mG = n.toInt()
                        "blue" -> if (mB < n.toInt()) mB = n.toInt()
                    }
                }
            }

            total += (mR * mG * mB)
        }
        return total
    }
}
