-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanNPMPocExfilA\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilesize)()
if l_0_0 > 51200 then
  return mp.CLEAN
end
local l_0_1 = 0
do
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC15: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC16: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC17: Overwrote pending register: R4 in 'AssignReg'

  for l_0_6,l_0_7 in ("SCPT:NpmY_Collect_Hostname")("SCPT:NpmY_Collect_UserInfo") do
  end
  if not (mp.get_mpattribute)(l_0_7) or l_0_1 < 1 then
    return mp.CLEAN
  end
  if not (mp.get_mpattribute)("SCPT:NpmY_ReqHttp") and not (mp.get_mpattribute)("SCPT:NpmY_ReqAxios") and not (mp.get_mpattribute)("SCPT:NpmY_ReqNodeFetch") and not (mp.get_mpattribute)("SCPT:NpmY_ReqDns") then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

