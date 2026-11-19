-- Threat: !InfrastructureShared
-- Name: !#Lua:NSISScriptScan
-- Type: 12
-- MpAttributes: !RPF:TopLevelFile

local l_0_0 = mp.getfilesize()
if 33554432 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = string.lower(mp.getfilename())
if string.find(l_0_1, "(nsis-instdata)", -15, true) then
  local l_0_2 = 0
  local l_0_3 = 64
  mp.readprotection(false)
  local l_0_4 = mp.readfile(l_0_2, 8)
  local l_0_5 = mp.readu_u32(l_0_4, 1)
  if l_0_5 == l_0_0 then
    l_0_5 = mp.readu_u32(l_0_4, 5)
    l_0_2 = 4
  end
  if 512 < l_0_5 then
    return mp.CLEAN
  end
  local l_0_6 = mp.readfile(l_0_2 + 4, l_0_3)
  for l_0_7 = 1, l_0_3, 8 do
    if l_0_0 < mp.readu_u32(l_0_6, l_0_7) then
      return mp.CLEAN
    end
  end
  mp.set_mpattribute("MpIsExhaustiveScriptScan")
end
return mp.CLEAN
