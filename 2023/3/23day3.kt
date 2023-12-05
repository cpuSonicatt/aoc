import java.io.File

fun main() {

    val s = DayThree2023("2023/3/i")
    println(s.partOne())
    println(s.partTwo())
}

class DayThree2023(private val path: String) {

    fun partOne(): Int {

        val schem = File(path).readLines().map { it.toList() }
        var total = 0

        schem.forEachIndexed { i, line ->
            val found = Regex("(\\d+)").findAll(line.joinToString("")).toList()
            val yranges = found.map { it.range }.toList().map {
                Pair(
                    if (it.first - 1 <= 0) 0 else it.first - 1,
                    if (it.last + 1 >= line.size) line.size - 1 else it.last + 1
                )
            }
            val xrange = IntRange(if (i - 1 <= 0) 0 else i - 1, if (i + 1 >= schem.size) schem.size - 1 else i + 1)
            val nums = found.map { it.value.toInt() }

            if (found.isNotEmpty()) {
                yranges.forEachIndexed { ii, yr ->
                    if (xrange.joinToString("") { xr ->
                            schem[xr].subList(yr.first, yr.second + 1).joinToString("")
                        }.filterNot { it.isDigit() || it == '.' }.isNotEmpty()) total += nums[ii]

                }
            }
        }

        return total
    }

    fun partTwo(): Int {
        val schem = File(path).readLines()
        var total = 0

        schem.forEachIndexed { y, line ->

            line.indices.filter { line[it] == '*' }.toList().forEach { x ->
                val (xx, yy) = listOf(
                    (x - 1..x + 1).filter { it >= 0 && it < line.length },
                    (y - 1..y + 1).filter { it >= 0 && it < schem.size }
                )

                val nums: MutableSet<Int> = mutableSetOf()
                yy.forEach { yit ->
                    xx.forEach { xit ->
                        if (schem[yit][xit].isDigit()) {
                            nums.add(findNums(schem, yit, xit))
                        }
                    }
                }
                if (nums.size == 2) {
                    total += nums.product()
                }

            }
        }
        return total
    }

    private fun Collection<Int>.product(): Int {
        var t = 1
        this.forEach { t *= it }
        return t
    }

    private fun findNums(schem: List<String>, y: Int, x: Int): Int {
        var left = x
        var right = x

        while (left >= 0 && schem[y][left].isDigit()) {
            left--
        }
        left += 1

        while (right < schem[y].length && schem[y][right].isDigit()) {
            right++
        }

        return schem[y].substring(left, right).toInt()
    }


}
