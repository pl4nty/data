-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\19b34e5420eb\1_luac 

-- params : ...
-- function num : 0
if not (this_sigattrlog[1]).matched or (this_sigattrlog[1]).utf8p1 == nil or (this_sigattrlog[1]).utf8p1 == "" then
  return mp.CLEAN
end
local l_0_0 = (this_sigattrlog[1]).utf8p1
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC26: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC27: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC28: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in ("/private/tmp/")("/users/shared/") do
    if StringStartsWith((string.lower)(l_0_0), l_0_6) then
      return mp.INFECTED
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

