import java.io.File

fun main() {

    val s = DayOne2023("2023/1/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayOne2023 constructor(private val path: String) {

    fun partOne(): Int {
        val dirs: List<String> = File(path).readLines()
        var total = 0
        dirs.forEach {
            val res = Regex("(\\d)").findAll(it)
            total += (res.first().value + res.last().value).toInt()
        }
        return total
    }

    fun partTwo(): Int {
        val dirs: List<String> = File(path).readLines()
        val numsMap: Map<String, String> = mapOf("one" to "1", "two" to "2", "three" to "3", "four" to "4", "five" to "5", "six" to "6", "seven" to "7", "eight" to "8", "nine" to "9")
        val numsList = listOf("one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "1", "2", "3", "4", "5", "6", "7", "8", "9")
        var total = 0

        dirs.forEach {
            val first = it.findAnyOf(numsList)?.second
            val last = it.findLastAnyOf(numsList)?.second
            total += ((numsMap[first] ?: first) + (numsMap[last] ?: last)).toInt()
        }
        return total
    }
}
