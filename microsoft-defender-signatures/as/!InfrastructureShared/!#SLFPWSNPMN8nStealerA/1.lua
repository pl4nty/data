-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFPWSNPMN8nStealerA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 30720 then
  return mp.CLEAN
end
local l_0_1 = 0
local l_0_2 = {}
-- DECOMPILER ERROR at PC14: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC15: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC16: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("SCPT:NpmY_N8n_Db")("SCPT:NpmY_N8n_CredEntity") do
end
if not (mp.get_mpattribute)(l_0_7) or l_0_1 < 2 then
  return mp.CLEAN
end
local l_0_8 = 0
do
  local l_0_9 = {}
  -- DECOMPILER ERROR at PC41: No list found for R4 , SetList fails

  -- DECOMPILER ERROR at PC42: Overwrote pending register: R5 in 'AssignReg'

  -- DECOMPILER ERROR at PC43: Overwrote pending register: R6 in 'AssignReg'

  for l_0_13,l_0_14 in ("SCPT:NPMCreds_Cred_AwsCred")("SCPT:NPMCreds_Cred_SshIdrsa") do
    -- DECOMPILER ERROR at PC46: Overwrote pending register: R10 in 'AssignReg'

  end
  if not (("SCPT:NpmY_Collect_Npmrc").get_mpattribute)(l_0_14) or l_0_8 < 2 then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

