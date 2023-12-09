import java.io.File
import kotlin.math.abs

fun main() {
    val s = DayNine2023("2023/9/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayNine2023(private val path: String) {

    fun partOne(): Long {
        val data = File(path).readLines().map { it.split(" ") }
        var sum = 0L
        data.forEach {
            val found: MutableList<MutableList<Int>> = mutableListOf(it.map { i -> i.toInt() }.toMutableList())
            var curr = found[0]
            while (!curr.all { i -> i == 0 } || curr.isEmpty()) {
                curr = curr.diffs().toMutableList()
                found.add(curr)
            }
            for (i in found.size - 1 downTo 1) {
                found[i-1].add(found[i-1].last() + found[i].last())
            }
            sum += found[0].last().toLong()
        }
        return sum
    }

    fun partTwo(): Long {
        val data = File(path).readLines().map { it.split(" ").map { x -> x.toInt() }.reversed() }
        var sum = 0L
        data.forEach {
            val found: MutableList<MutableList<Int>> = mutableListOf(it.toMutableList())
            var curr = found[0]
            while (!curr.all { i -> i == 0 } || curr.isEmpty()) {
                curr = curr.diffs().toMutableList()
                found.add(curr)
            }
            for (i in found.size - 1 downTo 1) {
                found[i-1].add(found[i-1].last() + found[i].last())
            }
            sum += found[0].last().toLong()
        }
        return sum
    }

    private fun List<Int>.diffs(): List<Int> {
        val diffs: MutableList<Int> = mutableListOf()
        for (i in 0..< this.size - 1) {
            diffs.add(this[i+1] - this[i])
        }
        return diffs
    }

}
