-- Threat: !InfrastructureShared
-- Name: 8db3fda88bfc
-- Type: 21

local l_0_0 = bm.get_imagepath()
if l_0_0 ~= nil and string.len(l_0_0) >= 15 then
  local l_0_1 = {
    ["services.exe"] = true,
    ["msmpeng.exe"] = true,
    ["trustedinstaller.exe"] = true,
    ["tiworker.exe"] = true,
    ["poqexec.exe"] = true,
    ["mbamservice.exe"] = true,
    ["osrssinst.exe"] = true,
    ["core.exe"] = true,
    ["instup.exe"] = true,
    ["tguard.exe"] = true,
    ["nortonsecurity.exe"] = true,
    ["mfehidin.exe"] = true,
    ["mfeamcin.exe"] = true,
    ["avp.exe"] = true,
    ["computerztray.exe"] = true,
    ["w32tm.exe"] = true,
    ["printisolationhost.exe"] = true,
    ["xlserviceplatform.exe"] = true,
    ["zhudongfangyu.exe"] = true,
    ["qqlivesetupex.exe"] = true
  }
  local l_0_2 = l_0_0:match("\\([^\\]+)$")
  if l_0_2 ~= nil then
    l_0_2 = string.lower(l_0_2)
    if l_0_1[l_0_2] then
      return mp.CLEAN
    end
  end
end
local l_0_3
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_3 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_3:find("\\spool\\drivers\\x64\\3\\printconfig.dll") then
  return mp.CLEAN
elseif l_0_3:find("\\windows\\system32\\hpzipm12.dll") then
  return mp.CLEAN
end
if l_0_3 ~= nil then
  local l_0_4 = mp.GetExecutablesFromCommandLine(l_0_3)
  for l_0_5, l_0_6 in ipairs(l_0_4) do
    l_0_6 = mp.ContextualExpandEnvironmentVariables(l_0_6)
    if sysio.IsFileExists(l_0_6) then
      bm.add_related_file(l_0_6)
    end
  end
end
local l_0_7 = MpCommon.GetPersistContextNoPath("ServiceCreationScript")
if l_0_7 then
  for l_0_8, l_0_9 in ipairs(l_0_7) do
    if sysio.IsFileExists(l_0_9) then
      bm.add_related_file(l_0_9)
    end
  end
end
return mp.INFECTED
