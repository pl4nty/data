-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\a831_2708.luac 

-- params : ...
-- function num : 0
if not (mp.get_mpattribute)("PUA:CERT:PCAppStore") then
  return mp.CLEAN
end
if (this_sigattrlog[2]).matched and (this_sigattrlog[4]).matched then
  local l_0_0 = (this_sigattrlog[2]).p2
  local l_0_1 = (this_sigattrlog[4]).p2
  if l_0_0 ~= l_0_1 and not (l_0_1:lower()):find("pc +app +store +setup$") then
    return mp.CLEAN
  end
  local l_0_2 = l_0_0:lower()
  if l_0_2:find("^spark +setup$") or l_0_0:find("^fast[!]? +setup$") then
    return mp.CLEAN
  end
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC103: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC104: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC105: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC106: Overwrote pending register: R6 in 'AssignReg'

  -- DECOMPILER ERROR at PC107: Overwrote pending register: R7 in 'AssignReg'

  -- DECOMPILER ERROR at PC108: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC109: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC110: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC111: Overwrote pending register: R11 in 'AssignReg'

  -- DECOMPILER ERROR at PC112: Overwrote pending register: R12 in 'AssignReg'

  -- DECOMPILER ERROR at PC113: Overwrote pending register: R13 in 'AssignReg'

  -- DECOMPILER ERROR at PC114: Overwrote pending register: R14 in 'AssignReg'

  -- DECOMPILER ERROR at PC115: Overwrote pending register: R15 in 'AssignReg'

  -- DECOMPILER ERROR at PC116: Overwrote pending register: R16 in 'AssignReg'

  -- DECOMPILER ERROR at PC117: Overwrote pending register: R17 in 'AssignReg'

  -- DECOMPILER ERROR at PC118: Overwrote pending register: R18 in 'AssignReg'

  -- DECOMPILER ERROR at PC119: Overwrote pending register: R19 in 'AssignReg'

  -- DECOMPILER ERROR at PC120: Overwrote pending register: R20 in 'AssignReg'

  -- DECOMPILER ERROR at PC121: Overwrote pending register: R21 in 'AssignReg'

  -- DECOMPILER ERROR at PC122: Overwrote pending register: R22 in 'AssignReg'

  -- DECOMPILER ERROR at PC123: Overwrote pending register: R23 in 'AssignReg'

  -- DECOMPILER ERROR at PC124: Overwrote pending register: R24 in 'AssignReg'

  -- DECOMPILER ERROR at PC125: Overwrote pending register: R25 in 'AssignReg'

  -- DECOMPILER ERROR at PC126: Overwrote pending register: R26 in 'AssignReg'

  -- DECOMPILER ERROR at PC127: Overwrote pending register: R27 in 'AssignReg'

  -- DECOMPILER ERROR at PC128: Overwrote pending register: R28 in 'AssignReg'

  -- DECOMPILER ERROR at PC129: Overwrote pending register: R29 in 'AssignReg'

  -- DECOMPILER ERROR at PC130: Overwrote pending register: R30 in 'AssignReg'

  -- DECOMPILER ERROR at PC131: Overwrote pending register: R31 in 'AssignReg'

  -- DECOMPILER ERROR at PC132: Overwrote pending register: R32 in 'AssignReg'

  -- DECOMPILER ERROR at PC133: Overwrote pending register: R33 in 'AssignReg'

  -- DECOMPILER ERROR at PC134: Overwrote pending register: R34 in 'AssignReg'

  -- DECOMPILER ERROR at PC135: Overwrote pending register: R35 in 'AssignReg'

  -- DECOMPILER ERROR at PC136: Overwrote pending register: R36 in 'AssignReg'

  -- DECOMPILER ERROR at PC137: Overwrote pending register: R37 in 'AssignReg'

  -- DECOMPILER ERROR at PC138: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC139: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC140: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC141: Overwrote pending register: R6 in 'AssignReg'

  for l_0_7 = "^personal +store +setup$", "shop +setup$", "market +setup$" do
    -- DECOMPILER ERROR at PC143: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC143: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC144: Overwrote pending register: R10 in 'AssignReg'

    if ("buy +setup$")("baz[a-z]*ar[a-z]* +setup$", "sale +setup$") then
      return mp.INFECTED
    end
  end
end
do
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

