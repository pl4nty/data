-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#ALFLuaSuspToolsinSuspLocSA\1.luac 

-- params : ...
-- function num : 0
if (mp.get_mpattributesubstring)("SLF:HackTool:") or (mp.get_mpattributesubstring)("SLF:VirTool:") or (mp.get_mpattributesubstring)("ALF:HackTool:") or (mp.get_mpattributesubstring)("ALF:VirTool:") then
  local l_0_0 = (MpCommon.PathToWin32Path)((mp.get_contextdata)(mp.CONTEXT_DATA_FILEPATH))
  if l_0_0 == nil or #l_0_0 < 9 then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0:match("(.+)\\[^\\]+$")
  l_0_1 = (string.lower)(l_0_1)
  local l_0_2 = {}
  -- DECOMPILER ERROR at PC53: No list found for R2 , SetList fails

  -- DECOMPILER ERROR at PC54: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC55: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC56: Overwrote pending register: R5 in 'AssignReg'

  if (":\\programdata$")(":\\perflogs$", ":\\users\\.*\\music$", false) then
    return mp.INFECTED
  end
end
do
  return mp.CLEAN
end

