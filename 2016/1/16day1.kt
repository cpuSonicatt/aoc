import java.io.File
import kotlin.math.abs

fun main() {
    println(onePartOne16())
    println(twoPartTwo16())
}

fun onePartOne16(): Int {
    val dirs: List<String> = File("2016/1/i").readLines()[0].split(", ")
    val go: List<Pair<Int, Int>> = listOf(Pair(0,1), Pair(1,0), Pair(0,-1), Pair(-1, 0)) // N E S W

    var facing = 0
    var xy: Pair<Int, Int> = Pair(0,0)

    for (dir in dirs) {
        when (dir.take(1)) {
            "L" -> facing += 1
            "R" -> facing -= 1
        }

        facing = Math.floorMod(facing, 4)

        val gox = go[facing].first * dir.substring(1).toInt()
        val goy = go[facing].second * dir.substring(1).toInt()
        xy = xy.copy(xy.first + gox, xy.second + goy)
    }
    return abs(xy.first) + abs(xy.second)
}

fun twoPartTwo16(): Int {
    val dirs: List<String> = File("2016/1/i").readLines()[0].split(", ")
    val go: List<Pair<Int, Int>> = listOf(Pair(0,1), Pair(1,0), Pair(0,-1), Pair(-1, 0)) // N E S W
    val visited: MutableSet<Pair<Int, Int>> = mutableSetOf()

    var facing = 0
    var xy: Pair<Int, Int> = Pair(0,0)

    for (dir in dirs) {
        when (dir.take(1)) {
            "L" -> facing += 1
            "R" -> facing -= 1
        }

        facing = Math.floorMod(facing, 4)

        if (go[facing].first != 0) {
            for (x in 1..dir.substring(1).toInt()) {
                xy = xy.copy(xy.first + go[facing].first, xy.second)
                if (!visited.add(xy)) {
                    return abs(xy.first) + abs(xy.second)
                }
            }
        } else {
            for (y in 1..dir.substring(1).toInt()) {
                xy = xy.copy(xy.first, xy.second + go[facing].second)
                if (!visited.add(xy)) {
                    return abs(xy.first) + abs(xy.second)
                }
            }
        }
    }
    return -1
}