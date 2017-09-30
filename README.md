# Lua-KeywordsFilter
====================

### Using trie tree, find and replace keywords with ***

![](https://github.com/ikool-cn/Lua-KeywordsFilter/blob/master/trie.jpg)  

### Require Lua >= 5.2 OR Luajit

### Dict struct

```lua
Dict = {}
Dict.table = {"fuck", "brag", "bitch"}
return Dict
```
### Test case

```lua
Filter.initTrieTree()
str = "You cheap, lying, no good, rotten, floor flushing, low life, snake licking, dirt eating, inbred, over-stuffed, ignorant, blood-sucking, dog kissing, brainless, dickless, hopeless, heartless, fatass, bug-eyed, stiff-legged, spineless, worm-headed sack of monkey shit! fuck"
for i = 1, 1000000 do
	Filter.replace(str)
end
-- time 4.2s
```