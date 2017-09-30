require("Dict")

Filter = {}
local TrieTree
local Leaves

--构造trie字典树
function Filter.initTrieTree()
    Filter.TrieTree = {}
    Filter.Leaves = {}

    local record = Dict.table
    for i = 1, #record do
        local word = record[i]
        local t = Filter.TrieTree
        for j = 1, #word do
            local c = string.byte(word, j)
            if not t[c] then
                t[c] = {}
            end
            t = t[c]
        end
        Filter.Leaves[word] = true
    end
end

--替换字典中的词为***
function Filter.replace(str)
    local matchs = {}
    local leaves = Filter.Leaves
    for i = 1, #str do
        local x = i
        local y = x
        local t = Filter.TrieTree
        while true do
            if not t[string.byte(str, y)] then
                y = y - 1
                break
            end
            t = t[string.byte(str, y)]
            y = y + 1
        end
        if y >= x then
            local word = string.sub(str, x, y)
            if leaves[word] then
                table.insert(matchs, { b = x, e = y, l = (y - x + 1) })
            end
        end
    end
    if #matchs > 0 then
        local ret = ''
        local pos = 1
        for _, v in ipairs(matchs) do
            ret = ret .. string.sub(str, pos, v.b - 1) .. "***"
            pos = v.e + 1
        end
        ret = ret .. string.sub(str, pos, #str)
        return ret
    end
    return str
end