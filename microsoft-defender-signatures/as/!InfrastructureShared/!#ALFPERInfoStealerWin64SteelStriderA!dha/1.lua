-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFPERInfoStealerWin64SteelStriderA!dha\1.luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (pe.get_exports)()
if l_0_0 < 10 or l_0_0 > 400 then
  return mp.CLEAN
end
local l_0_2 = 0
for l_0_6 = 1, l_0_0 do
  local l_0_7 = (pe.mmap_string_rva)((l_0_1[l_0_6]).namerva, 64)
  if l_0_7 == "ExtractEdgePasswordsToFile" or l_0_7 == "ExtractEdgePasswords" then
    l_0_2 = l_0_2 + 1
    if l_0_2 == 2 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN

