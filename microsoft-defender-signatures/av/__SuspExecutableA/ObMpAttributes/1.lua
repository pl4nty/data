-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\__SuspExecutableA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_contextdata)(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 ~= mp.SCANREASON_ONMODIFIEDHANDLECLOSE or l_0_0 ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_1, l_0_2 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_2 == nil or l_0_2 == "" or l_0_1 == nil or l_0_1 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_1, "/bin/", 1, true) == 1 or (((string.find)(l_0_1, "/usr/", 1, true) == 1 and not (string.find)(l_0_1, "/usr/local/", 1, true) == 1) or (string.find)(l_0_1, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
if (string.find)(l_0_1, "empyre", 1, true) or (string.find)(l_0_1, "metasploit", 1, true) or (string.find)(l_0_1, "edr_attack", 1, true) then
  local l_0_3 = {}
  -- DECOMPILER ERROR at PC157: No list found for R3 , SetList fails

  -- DECOMPILER ERROR at PC158: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC159: Overwrote pending register: R5 in 'AssignReg'

  for l_0_7,l_0_8 in ("ransomware")("coinminer") do
    -- DECOMPILER ERROR at PC164: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC166: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC167: Overwrote pending register: R11 in 'AssignReg'

    -- DECOMPILER ERROR at PC168: Overwrote pending register: R12 in 'AssignReg'

    if l_0_8 ~= nil and (("backdoor").find)("mettle", "phish", "meterpreter", true) then
      (mp.set_mpattribute)("BM_SuspFilename")
      return mp.INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC183: Overwrote pending register: R3 in 'AssignReg'

    do return l_0_3 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

