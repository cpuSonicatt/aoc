import java.io.File

fun main() {
    val s = DaySeven2023("2023/7/i")
    println(s.partOne())
    println(s.partTwo())
}

class DaySeven2023(private val path: String) {
    fun partOne(): Int {
        val order = "AKQJT98765432"

        val info: List<Pair<String, Int>> = File(path).readLines()
            .map {
                val cb = it.split(" ")
                Pair(cb[0], cb[1].toInt())
            }
            .sortedWith(
                compareBy<Pair<String, Int>> {
                    rankOne(it.first)
                }.thenBy {
                    order.indexOf(it.first[0])
                }.thenBy {
                    order.indexOf(it.first[1])
                }.thenBy {
                    order.indexOf(it.first[2])
                }.thenBy {
                    order.indexOf(it.first[3])
                }.thenBy {
                    order.indexOf(it.first[4])
                }
            ).reversed()

        return info.sumOf { it.second * (info.indexOf(it) + 1) }
    }

    // in progress
    fun partTwo(): Int {
        val order = "AKQT98765432J"

        val info: List<Pair<String, Int>> = File(path).readLines()
            .map {
                val cb = it.split(" ")
                Pair(cb[0], cb[1].toInt())
            }


        info.sortedWith(
            compareBy<Pair<String, Int>> {
                rankTwo(it.first)
            }.thenBy {
                order.indexOf(it.first[0])
            }.thenBy {
                order.indexOf(it.first[1])
            }.thenBy {
                order.indexOf(it.first[2])
            }.thenBy {
                order.indexOf(it.first[3])
            }.thenBy {
                order.indexOf(it.first[4])
            }
        ).reversed()

        println()
        info.forEachIndexed { i, it ->
            println("${it.first} - Rank #${i + 1}")
        }

        return info.sumOf { it.second * (info.indexOf(it) + 1) }
    }

    private fun rankOne(hand: String): Int {
        return if (hand.isXOfAKind(5)) {
            0
        } else if (hand.isXOfAKind(4)) {
            1
        } else if (hand.isFullHouse()) {
            2
        } else if (hand.isXOfAKind(3)) {
            3
        } else if (hand.isTwoPair()) {
            4
        } else if (hand.isXOfAKind(2)) {
            5
        } else 6
    }

    private fun rankTwo(hand: String): Int {
        val jokers = hand.countOccur('J')
        return if (hand.isXOfAKind(5, jokers)) {
            0
        } else if (hand.isXOfAKind(4, jokers)) {
            1
        } else if (hand.isFullHouse(jokers)) {
            2
        } else if (hand.isXOfAKind(3, jokers)) {
            3
        } else if (hand.isTwoPair(jokers)) {
            4
        } else if (hand.isXOfAKind(2, jokers)) {
            5
        } else {
            6
        }
    }

    private fun String.isXOfAKind(x: Int, jokers: Int = 0): Boolean {
        if (jokers != 0) {
            return (this.filter { it != 'J' }.map { this.countOccur(it) }.maxOrNull() ?: 0) + jokers >= x
//            return this.filter { it != 'J' }
        }
        return this.any { this.countOccur(it) == x }
    }

    private fun String.isTwoPair(jokers: Int = 0) = this.filter { c -> this.countOccur(c) - jokers == 2 }.length == 4

    private fun String.isFullHouse(jokers: Int = 0) = this.isXOfAKind(3, jokers) && this.isXOfAKind(2, jokers)

    private fun String.countOccur(c: Char): Int = this.count { it == c }

}