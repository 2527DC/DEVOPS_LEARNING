Question 1:
How many queries does this run, what is the problem called, and does Promise.all fix it?

Code:
query("SELECT * FROM schools LIMIT 50");
...
query("SELECT * FROM photos WHERE school_id = $1", [s.id]);

Options:
A) 50 queries; connection starvation; yes — Promise.all overlaps the waits and frees the pool sooner
B) 51 queries; the N+1 problem; no — Promise.all fires the same 50 at once and bursts the pool
C) 51 queries; lazy loading; partially — Promise.all fixes latency but not the query count
D) 50 queries; the N+1 problem; yes — batching happens automatically once the calls are concurrent

Correct Answer:
B) 51 queries; the N+1 problem; no — Promise.all fires the same 50 at once and bursts the pool

--------------------------------------------------

Question 2:
Shortest path between two users in an unweighted social graph (fewest hops). Which traversal, and why?

Options:
A) DFS — it commits to a path and backtracks, so the first complete path found is shortest
B) BFS — it explores level by level, so the first time it reaches the target is via fewest edges
C) Either — both visit every node once, so both find the minimum-hop path in O(V + E)
D) Dijkstra — shortest-path problems require a priority queue regardless of edge weights

Correct Answer:
B) BFS — it explores level by level, so the first time it reaches the target is via fewest edges

--------------------------------------------------

Question 3:
School 1 has photos; school 2 has none. What does this return?

Code:
SELECT s.id
FROM schools s LEFT JOIN photos p ON p.school_id = s.id
WHERE p.cat = 'campus';

Options:
A) Both schools — the LEFT JOIN guarantees every school row survives the filter
B) Only school 1 — the WHERE on a right-table column silently converts the LEFT JOIN into an INNER JOIN
C) School 1 plus a NULL row for school 2 preserved by the outer join semantics
D) Zero rows — filtering a nullable joined column invalidates the whole result set

Correct Answer:
B) Only school 1 — the WHERE on a right-table column silently converts the LEFT JOIN into an INNER JOIN