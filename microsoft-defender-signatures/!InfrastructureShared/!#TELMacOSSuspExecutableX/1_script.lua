-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#TELMacOSSuspExecutableX\1_luac 

-- params : ...
-- function num : 0
local l_0_0, l_0_1 = (mp.getfilename)((mp.bitor)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_PATH), mp.FILEPATH_QUERY_LOWERCASE))
if l_0_1 == nil or l_0_1 == "" or l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
if (string.find)(l_0_0, "/bin/", 1, true) == 1 or (((string.find)(l_0_0, "/usr/", 1, true) == 1 and not (string.find)(l_0_0, "/usr/local/", 1, true) == 1) or (string.find)(l_0_0, "/applications/microsoft defender.app/", 1, true) == 1) then
  return mp.CLEAN
end
if (string.find)(l_0_0, "empyre", 1, true) or (string.find)(l_0_0, "metasploit", 1, true) or (string.find)(l_0_0, "edr_attack", 1, true) then
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC141: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC142: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC143: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("ransomware")("coinminer") do
    -- DECOMPILER ERROR at PC148: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC150: Overwrote pending register: R9 in 'AssignReg'

    -- DECOMPILER ERROR at PC151: Overwrote pending register: R10 in 'AssignReg'

    -- DECOMPILER ERROR at PC152: Overwrote pending register: R11 in 'AssignReg'

    if l_0_7 ~= nil and (("backdoor").find)("mettle", "phish", "meterpreter", true) then
      (mp.set_mpattribute)("BM_SuspFilename")
      return mp.INFECTED
    end
  end
end
do
  do
    -- DECOMPILER ERROR at PC167: Overwrote pending register: R2 in 'AssignReg'

    do return l_0_2 end
    -- WARNING: undefined locals caused missing assignments!
  end
end

