-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaContextPEFileSectionInfoA\1.luac 

-- params : ...
-- function num : 0
if pehdr == nil or pehdr.NumberOfSections == nil or pesecs == nil then
  return mp.CLEAN
end
local l_0_0 = pehdr.NumberOfSections
if l_0_0 == nil then
  return mp.CLEAN
end
;
(mp.set_mpattribute)("Lua:Context/PeFileNumberOfSections!" .. tostring(l_0_0))
if l_0_0 == 0 then
  return mp.CLEAN
end
local l_0_1 = "Lua:Context/PeFileSection"
for l_0_5 = 1, l_0_0 do
  do
    do
      local l_0_6 = (pesecs[l_0_5]).Name
      if (pesecs[l_0_5]).Name ~= nil then
        (mp.set_mpattribute)(l_0_1 .. tostring(l_0_5) .. "!" .. (string.lower)(l_0_6))
      end
      if l_0_5 >= 8 then
        break
      end
      -- DECOMPILER ERROR at PC62: LeaveBlock: unexpected jumping out DO_STMT

    end
  end
end
return mp.CLEAN

