-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\0x00001da5_luac 

-- params : ...
-- function num : 0
if (mp.get_mpattribute)("elfa_isgocompiled") then
  local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
  if l_0_0 == nil or #l_0_0 < 4 then
    return mp.CLEAN
  end
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC28: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC29: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC30: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in (".deb")(".iso") do
    if (string.find)(l_0_0, l_0_6, -1 * #l_0_6, true) then
      return mp.CLEAN
    end
  end
  local l_0_7 = {}
  -- DECOMPILER ERROR at PC54: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: Overwrote pending register: R4 in 'AssignReg'

  for l_0_11,l_0_12 in ("kali")(".dpkg") do
    if (string.find)(l_0_0, l_0_12, 1, true) then
      return mp.CLEAN
    end
  end
  return mp.INFECTED
end
do
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

