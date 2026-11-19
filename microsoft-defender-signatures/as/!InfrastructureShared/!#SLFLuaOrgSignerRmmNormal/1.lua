-- Threat: !InfrastructureShared
-- Name: !#SLF:Lua:OrgSignerRmmNormal
-- Type: 13
-- MpAttributes: RPF:TopLevelFile & (Lua:EXEExt | Lua:MSIExt) & (PEPCODE:HasDigitalSignature | BM_HAS_DIGITALSIGNATURE)

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if string.sub(l_0_0, -4) ~= ".exe" and string.sub(l_0_0, -4) ~= ".msi" then
  return mp.CLEAN
end
local l_0_1 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = {
  "\\avecto\\privilege guard client\\",
  "\\system32\\pmlauncher.exe",
  "\\beyondtrust\\pbpsmon\\",
  "\\manageengine\\uems_agent\\endpointdlp\\",
  "\\manageengine\\uems_agent\\edr\\",
  "\\desktopcentral_agent\\edr\\",
  "\\manageengine\\uems_agent\\devicecontrol\\",
  "\\manageengine\\uems_agent\\appctrl\\",
  "\\manageengine\\uems_agent\\bitlockermgmt\\",
  "\\manageengine\\uems_agent\\endpointintelligence\\",
  "\\manageengine\\uems_agent\\compliance\\",
  "\\manageengine\\uems_agent\\client-data\\vulnerable-resources\\",
  "\\manageengine\\uems_agent\\dcconfig.exe",
  "\\manageengine\\uems_agent\\bin\\compvulndetection.exe",
  "\\manageengine\\uems_agent\\bin\\secaddoncrashanalyser.exe",
  "\\manageengine\\uems_agent\\bin\\meaap.exe",
  "\\manageengine\\uems_agent\\bin\\dcuninstallsw.exe",
  "\\manageengine\\uems_agent\\bin\\dcusbsummary.exe",
  "\\manageengine\\uems_agent\\bin\\dcinventory.exe",
  "\\manageengine\\uems_agent\\bin\\dcagentupgrader.exe",
  "\\manageengine\\uems_agent\\bin\\dcswmeter.exe",
  "\\manageengine\\uems_agent\\bin\\dcstatusutil.exe",
  "\\manageengine\\uems_agent\\bin\\dcpatchscan.exe",
  "\\manageengine\\uems_agent\\bin\\dcagenttrayicon.exe",
  "\\manageengine\\uems_agent\\bin\\dcuploadlogs.exe",
  "\\manageengine\\uems_agent\\bin\\uemslogcollector.exe",
  "\\manageengine\\adauditplusagent\\",
  "\\zoho corp\\adselfservice plus client software\\",
  "\\zoho\\zohoworkdrivets\\",
  "\\datto backup agent\\",
  "\\datto cloud continuity\\",
  "\\datto rollback driver\\",
  "\\datto\\workplace2\\",
  "\\datto\\datto windows agent\\",
  "\\backup manager\\",
  "\\gotomeeting\\",
  "\\program files\\goto\\",
  "\\netsupport\\netsupport notify\\",
  "\\netsupport\\netsupport school\\",
  "\\netsupport\\classroom.cloud\\",
  "\\realvnc\\vnc server\\printer driver\\",
  "\\dameware remote everywhere agent\\remoteprint\\",
  "\\packages\\plugins\\site24x7.",
  "\\site24x7\\winagent\\",
  "\\n-able technologies\\windows agent\\bin\\avdiu.exe",
  "\\n-able technologies\\windows agent\\bin\\nableavdusbridge.exe",
  "\\n-able technologies\\windows agent\\bin\\nableavdbridge.exe",
  "\\n-able technologies\\windows agent\\bin\\shadowprotectdatareader.exe",
  "\\n-able technologies\\windows agent\\temp\\msp-lwt-edr-module.exe",
  "\\logmein\\x64\\logmeinavserver.exe",
  "\\logmein\\x86\\logmeinavserver.exe",
  "\\infocyte\\agent\\",
  "\\lastpass\\",
  "\\teamviewer\\crashpad_handler.exe",
  "\\teamviewer\\writedump.exe",
  "\\teamviewer\\uninstall.exe",
  "\\manageengine\\uems_agent\\bin\\folder_backup.exe",
  "\\manageengine\\uems_agent\\bin\\dpinst86.exe",
  "\\manageengine\\uems_agent\\bin\\dpinst64.exe",
  "\\realvnc\\vnc server\\vnclicense.exe",
  "\\realvnc\\vnc server\\vnclicensewiz.exe",
  "\\centrastage\\uninst.exe",
  "\\gotoassist remote support customer\\1739\\g2ax_uninstaller_customer.exe"
}
for l_0_3, l_0_4 in ipairs(l_0_2) do
  if string.find(l_0_1, l_0_4, 1, true) then
    return mp.CLEAN
  end
end
local l_0_5 = versioning.GetOrgID()
if l_0_5 == nil or l_0_5 == "" then
  return mp.CLEAN
end
l_0_5 = string.lower(l_0_5)
local l_0_6 = mp.GetCertificateInfo()
if l_0_6 == nil or type(l_0_6) ~= "table" or #l_0_6 == 0 then
  return mp.CLEAN
end
local l_0_7 = 231
local l_0_8 = "!#OrgSignerRmmNormal"
local l_0_9 = {
  teamviewer = "teamviewer",
  ["teamviewer gmbh"] = "teamviewer",
  ["teamviewer germany gmbh"] = "teamviewer",
  ["zoho corporation"] = "zoho",
  ["zoho corporation private limited"] = "zoho",
  ["ninjarmm llc"] = "ninjaone",
  ["ninjarmm, llc"] = "ninjaone",
  ["ninjaone llc"] = "ninjaone",
  ["atera networks ltd"] = "atera",
  ["bomgar corporation"] = "beyondtrust",
  ["beyondtrust software inc"] = "beyondtrust",
  ["beyondtrust software, inc"] = "beyondtrust",
  ["beyondtrust corporation"] = "beyondtrust",
  ["datto inc"] = "kaseya",
  ["datto, llc"] = "kaseya",
  ["kaseya us llc"] = "kaseya",
  ["kaseya corporation"] = "kaseya",
  ["kaseya holdings inc."] = "kaseya",
  ["kaseya holdings inc"] = "kaseya",
  ["kaseya development, llc"] = "kaseya",
  ["remote utilities pty (cy) ltd"] = "remote utilities",
  ["remote utilities llc"] = "remote utilities",
  ["remote utilities pte. ltd."] = "remote utilities",
  ["realvnc limited"] = "realvnc",
  ["realvnc ltd"] = "realvnc",
  ["splashtop inc."] = "splashtop",
  ["servably, inc."] = "servably",
  ["servably inc."] = "servably",
  ["logmein, inc."] = "goto",
  ["goto technologies usa, llc"] = "goto",
  ["philandro software gmbh"] = "anydesk",
  ["anydesk software gmbh"] = "anydesk",
  ["nomachine s.a.r.l."] = "nomachine",
  ["connectwise, inc."] = "screenconnect",
  ["connectwise, llc"] = "screenconnect",
  ["connectwise limited"] = "screenconnect",
  screenconnect = "screenconnect",
  ["screenconnect.leverageitc.com"] = "screenconnect",
  ["action1 corporation"] = "action1",
  ["simplehelp ltd"] = "simplehelp",
  ["open source developer, huabing zhou"] = "purslane",
  purslane = "purslane",
  ["netsupport ltd."] = "netsupport",
  ["netsupport ltd"] = "netsupport",
  ["tsplus sas"] = "tsplus",
  ["n-able technologies ltd"] = "n-able"
}

local function l_0_10(l_1_0)
  local l_1_1 = {}
  for l_1_2, l_1_3 in ipairs(l_1_0) do
    if type(l_1_3) == "table" then
      local l_1_4 = l_1_3.Certificates
      if l_1_4 ~= nil and type(l_1_4) == "table" then
        for l_1_5, l_1_6 in ipairs(l_1_4) do
          if type(l_1_6) == "table" then
            local l_1_7 = l_1_6.Subject
            if l_1_7 ~= nil and type(l_1_7) == "table" and l_1_7.Organization ~= nil then
              local l_1_8 = mp.utf16to8(l_1_7.Organization)
              if l_1_8 ~= nil and l_1_8 ~= "" then
                l_1_1[#l_1_1 + 1] = string.lower(l_1_8)
              end
            end
          end
        end
      end
    end
  end
  if #l_1_1 == 0 then
    return nil
  end
  local l_1_9 = "|" .. table.concat(l_1_1, "|") .. "|"
  for l_1_10, l_1_11 in pairs(l_0_9) do
    if string.find(l_1_9, l_1_10, 1, true) ~= nil then
      return l_1_11
    end
  end
  return nil
end

local l_0_11 = l_0_10(l_0_6)
if l_0_11 == nil or l_0_11 == "" then
  return mp.CLEAN
end
local l_0_12 = l_0_5 .. "+empty"
local l_0_13 = l_0_5 .. "+" .. l_0_11
if l_0_12 == nil or l_0_12 == "" or l_0_13 == nil or l_0_13 == "" then
  return mp.CLEAN
end
local l_0_14 = crypto.CRC32Buffer(-1, l_0_12, 0, string.len(l_0_12))
local l_0_15 = crypto.Sha1Buffer(l_0_13, 0, string.len(l_0_13))
if l_0_14 == nil or l_0_15 == nil or l_0_15 == "" then
  return mp.CLEAN
end
local l_0_16, l_0_17 = MpCommon.NidSearch(l_0_7, l_0_14)
local l_0_18, l_0_19 = MpCommon.SNidSearch(l_0_7, l_0_15)
if l_0_16 == true and l_0_17 == l_0_8 and (l_0_18 ~= true or l_0_19 ~= l_0_8) then
  return mp.INFECTED
end
return mp.CLEAN
