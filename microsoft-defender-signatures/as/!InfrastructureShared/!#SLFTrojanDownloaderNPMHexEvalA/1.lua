-- Threat: !InfrastructureShared
-- Name: !#SLF:TrojanDownloader:NPM/HexEval.A
-- Type: 13
-- MpAttributes: SCPT:NpmJS & SCPT:NpmY_EvalRespData

local l_0_0 = mp.getfilesize()
if 51200 < l_0_0 then
  return mp.CLEAN
end
local l_0_1 = {
  "SCPT:NpmY_HexEval_Require",
  "SCPT:NpmY_HexEval_Axios",
  "SCPT:NpmY_HexEval_Http"
}
local l_0_2 = 0
for l_0_3, l_0_4 in ipairs(l_0_1) do
  if mp.get_mpattribute(l_0_4) then
    l_0_2 = l_0_2 + 1
  end
end
if l_0_2 < 3 then
  return mp.CLEAN
end
local l_0_5 = 0
local l_0_6 = {
  "SCPT:NpmY_Collect_Hostname",
  "SCPT:NpmY_Collect_UserInfo",
  "SCPT:NpmY_Collect_Cwd"
}
for l_0_7, l_0_8 in ipairs(l_0_6) do
  if mp.get_mpattribute(l_0_8) then
    l_0_5 = l_0_5 + 1
  end
end
if l_0_5 < 1 then
  return mp.CLEAN
end
return mp.INFECTED
