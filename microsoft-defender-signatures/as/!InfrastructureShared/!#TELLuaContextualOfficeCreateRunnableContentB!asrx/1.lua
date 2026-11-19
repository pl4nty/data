-- Threat: !InfrastructureShared
-- Name: !#TEL:Lua:ContextualOfficeCreateRunnableContent.B!asrx
-- Type: 13

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = {
  ["cmd.exe"] = true,
  ["conhost.exe"] = true,
  ["cscript.exe"] = true,
  ["java.exe"] = true,
  ["javaw.exe"] = true,
  ["mshta.exe"] = true,
  ["powershell.exe"] = true,
  ["rundll32.exe"] = true,
  ["wscript.exe"] = true
}
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
l_0_1 = (l_0_1 == nil and "" or l_0_1):lower()
if l_0_0[l_0_1] ~= true then
  return mp.CLEAN
end
local l_0_2 = MpCommon.GetPersistContext(mp.getfilename())
if l_0_2 == nil then
  return mp.CLEAN
end
local l_0_3 = false
for l_0_4, l_0_5 in ipairs(l_0_2) do
  if string.lower(l_0_5) == "contextualofficecreaterunnablecontent" then
    l_0_3 = true
    break
  end
end
if not l_0_3 then
  return mp.CLEAN
end
return mp.INFECTED
