-- Threat: !InfrastructureShared
-- Name: !#TEL:TrojanDownloader:JS/ObfJsDownloader
-- Type: 13
-- MpAttributes: RPF:TopLevelFile

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = {
  ["wscript.exe"] = true,
  ["cscript.exe"] = true
}
local l_0_1 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
if not l_0_0[l_0_1] then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
local l_0_3 = string.lower(mp.GetProcessCommandLine(l_0_2))
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = "programdata\\{%x%x%x%x%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%-%x%x%x%x%x%x%x%x%x%x%x%x}$"
if not string.find(l_0_4, l_0_5) and not string.find(l_0_3, "--iserik") then
  return mp.CLEAN
end

function hexToAscii(l_1_0)
  local l_1_1 = {}
  for l_1_2 = 1, #l_1_0, 2 do
    l_1_1[#l_1_1 + 1] = string.char(tonumber(l_1_0:sub(l_1_2, l_1_2 + 1), 16))
  end
  return table.concat(l_1_1, "")
end

for l_0_6 in string.gmatch(l_0_3, "(%x%x%x%x[%x]+)") do
  if not l_0_6:find("^68747470") then
    l_0_6 = string.lower(hexToAscii(l_0_6))
    if l_0_6 then
      MpCommon.SetPersistContext(l_0_6, {"isErik"}, 0)
    end
  end
end
return mp.INFECTED
