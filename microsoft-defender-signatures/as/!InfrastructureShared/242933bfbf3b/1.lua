-- Threat: !InfrastructureShared
-- Name: 242933bfbf3b
-- Type: 21

local l_0_0 = mp.getfilesize()
if l_0_0 == nil then
  return mp.CLEAN
end
if 50 < l_0_0 and l_0_0 < 10485760 then
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, 100)
  mp.readprotection(true)
  if l_0_1 == nil or #l_0_1 == 0 or #l_0_1 ~= 100 then
    return mp.CLEAN
  end
  local l_0_2 = l_0_1:match([[
([^
]*)]])
  if #l_0_2 == 0 then
    l_0_2 = l_0_1:match([[
^[^
]*
([^
]*)]])
  end
  if l_0_2 == nil or #l_0_2 == 0 then
    return mp.CLEAN
  end
  local l_0_3 = l_0_2:match("^%s*(.-)%s*$")
  if l_0_3 == nil or #l_0_3 == 0 then
    return mp.CLEAN
  end
  local l_0_4 = l_0_3:match("(%$%w+)")
  l_0_4 = l_0_4:match("^%s*(.-)%s*$")
  if l_0_4 == nil or #l_0_4 == 0 then
    return mp.CLEAN
  end
  local l_0_5 = l_0_3:match("=%s*(.*)$")
  if l_0_5 == nil or #l_0_5 == 0 then
    return mp.CLEAN
  end
  local l_0_6 = l_0_5:gsub("[%d%+%-%(%)*%^]", "")
  if l_0_6 == nil or #l_0_6 == 0 then
    return mp.CLEAN
  end
  l_0_6 = l_0_6:match("^%s*(.-)%s*$")
  if l_0_6 == nil or #l_0_6 == 0 then
    return mp.CLEAN
  end
  l_0_6 = l_0_6:gsub(l_0_4, "")
  local l_0_7 = l_0_6:gsub("[%s\t]", "")
  if #l_0_7 == 0 then
    return mp.INFECTED
  end
end
return mp.CLEAN
