import java.io.File

fun main() {
    println(twoPartOne16())
}

fun twoPartOne16(): String {
    val moves: List<String> = File("2016/2/i").readLines()
    var start = 5
    var code = ""

    for (move in moves) {
        for (udlr in move) {
            when (udlr) {
                'L' -> if (start - 1 !in intArrayOf(0,3,6))  start -= 1
                'U' -> if (start - 3 !in intArrayOf(-2,-1,0))  start -= 3
                'D' -> if (start + 3 !in intArrayOf(10,11,12))  start += 3
                'R' -> if (start + 1 !in intArrayOf(4,7,10))  start += 1
            }
        }
        code += start.toString()
    }

    return code
}