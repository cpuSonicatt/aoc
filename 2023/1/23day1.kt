import java.io.File

fun main() {

    val s = DayOne2023("2023/1/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayOne2023(private val path: String) {

    fun partOne(): Int {
        return File(path).readLines().sumOf {
            val res = Regex("(\\d)").findAll(it)
            (res.first().value + res.last().value).toInt()
        }
    }

    fun partTwo(): Int {
        val numsMap: Map<String, String> = mapOf("one" to "1", "two" to "2", "three" to "3", "four" to "4", "five" to "5", "six" to "6", "seven" to "7", "eight" to "8", "nine" to "9")
        val numsList = numsMap.keys.toList() + numsMap.values.toList()
        return File(path).readLines().sumOf {
            val first = it.findAnyOf(numsList)?.second
            val last = it.findLastAnyOf(numsList)?.second
            ((numsMap[first] ?: first) + (numsMap[last] ?: last)).toInt()
        }
    }
}
