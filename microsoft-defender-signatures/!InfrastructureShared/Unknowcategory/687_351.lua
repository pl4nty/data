-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\687_351.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.enum_mpattributesubstring)("Behavior:")
if #l_0_0 == 0 or l_0_0 == nil then
  return mp.INFECTED
end
for l_0_4,l_0_5 in ipairs(l_0_0) do
  if (string.find)(l_0_5, "Behavior:Win32/MaleficAms", 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED

