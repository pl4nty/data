-- Threat: !InfrastructureShared
-- Name: !#Lua:JsInsideZip
-- Type: 13
-- MpAttributes: Lua:FileInZip | Lua:FileIn7z | Lua:FileInRar

local l_0_0 = string.lower(mp.getfilename())
if l_0_0 ~= nil and (l_0_0:find(".zip->", 1, true) or l_0_0:find(".7z->", 1, true) or l_0_0:find(".tar.gz->", 1, true) or l_0_0:find(".rar->", 1, true)) then
  if l_0_0:match("%->.+/") or l_0_0:match("%->.+\\") or l_0_0:match("%->.+%->") then
    return mp.CLEAN
  end
  local l_0_1 = string.sub(l_0_0, -3)
  local l_0_2 = string.sub(l_0_0, -4)
  if l_0_1 == ".js" or l_0_2 == ".jse" or l_0_2 == ".wsf" then
    return mp.INFECTED
  end
end
return mp.CLEAN
