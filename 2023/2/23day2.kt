import java.io.File

fun main() {

    val s = DayTwo2023("2023/2/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayTwo2023(private val path: String) {

    fun partOne(): Int {
        return File(path).readLines().sumOf {
            val (gameNum, cubes) = Regex("Game (\\d+): (\\d+ .+)").find(it)!!.destructured
            if (!cubes.split("; ").map { r ->
                    r.split(", ").map { cu ->
                        val (n, c) = cu.split(" ")
                        c == "red" && n.toInt() <= 12
                                || c == "green" && n.toInt() <= 13
                                || c == "blue" && n.toInt() <= 14
                    }
                }.flatten().any { x -> !x }) gameNum.toInt() else 0
        }
    }

    fun partTwo(): Int {
        return File(path).readLines().sumOf {
            var mR = 0
            var mG = 0
            var mB = 0
            Regex("Game \\d+: (\\d+ .+)").find(it)!!.value.split("; ").map { r ->
                r.split(", ").map { cu ->
                    val (n, c) = cu.split(" ")
                    when (c) {
                        "red" -> if (mR < n.toInt()) mR = n.toInt()
                        "green" -> if (mG < n.toInt()) mG = n.toInt()
                        "blue" -> if (mB < n.toInt()) mB = n.toInt()
                    }
                }
            }
            (mR * mG * mB)
        }
    }
}
