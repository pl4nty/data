-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\52784659c\1.luac 

-- params : ...
-- function num : 0
if peattributes.isexe and peattributes.packed and pehdr.NumberOfSections > 7 then
  if mp.HSTR_WEIGHT == 3 then
    if (mp.get_mpattribute)("FOP:Win32/Crybot") then
      return mp.INFECTED
    end
    return mp.SUSPICIOUS
  end
  return mp.INFECTED
end
return mp.CLEAN

