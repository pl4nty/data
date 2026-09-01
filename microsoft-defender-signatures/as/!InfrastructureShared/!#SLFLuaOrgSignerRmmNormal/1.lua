-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFLuaOrgSignerRmmNormal\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FNAME, mp.FILEPATH_QUERY_LOWERCASE))
if (string.sub)(l_0_0, -4) ~= ".exe" and (string.sub)(l_0_0, -4) ~= ".msi" then
  return mp.CLEAN
end
local l_0_1 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
local l_0_2 = {}
-- DECOMPILER ERROR at PC76: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC77: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC78: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("\\avecto\\privilege guard client\\")("\\system32\\pmlauncher.exe") do
  -- DECOMPILER ERROR at PC81: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC83: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC84: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC85: Overwrote pending register: R11 in 'AssignReg'

  if (("\\desktopcentral_agent\\edr\\").find)("\\manageengine\\uems_agent\\devicecontrol\\", "\\manageengine\\uems_agent\\appctrl\\", "\\manageengine\\uems_agent\\bitlockermgmt\\", true) then
    return mp.CLEAN
  end
end
local l_0_8 = (versioning.GetOrgID)()
if l_0_8 == nil or l_0_8 == "" then
  return mp.CLEAN
end
local l_0_9 = (mp.GetCertificateInfo)()
if l_0_9 == nil or type(l_0_9) ~= "table" or #l_0_9 == 0 then
  return mp.CLEAN
end
local l_0_10 = 231
local l_0_11 = "!#OrgSignerRmmNormal"
local l_0_12 = {}
local l_0_14 = nil
if (function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_12
  local l_1_1 = {}
  for l_1_5,l_1_6 in ipairs(l_1_0) do
    if type(l_1_6) == "table" then
      local l_1_7 = l_1_6.Certificates
      if l_1_7 ~= nil and type(l_1_7) == "table" then
        for l_1_11,l_1_12 in ipairs(l_1_7) do
          if type(l_1_12) == "table" then
            local l_1_13 = l_1_12.Subject
            if l_1_13 ~= nil and type(l_1_13) == "table" and l_1_13.Organization ~= nil then
              local l_1_14 = (mp.utf16to8)(l_1_13.Organization)
              if l_1_14 ~= nil and l_1_14 ~= "" then
                local l_1_15 = #l_1_1 + 1
                l_1_1[l_1_15] = (string.lower)(l_1_14)
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
  local l_1_16 = nil
  for l_1_20,l_1_21 in l_1_16 do
    local l_1_21 = nil
    -- DECOMPILER ERROR at PC75: Overwrote pending register: R8 in 'AssignReg'

    l_1_21 = l_1_21("|" .. (table.concat)(l_1_1, "|") .. "|", l_1_19, 1, true)
    if l_1_21 ~= nil then
      return l_1_20
    end
  end
  -- DECOMPILER ERROR at PC86: Overwrote pending register: R3 in 'AssignReg'

  do return l_1_16 end
  -- DECOMPILER ERROR at PC88: Confused about usage of register R3 for local variables in 'ReleaseLocals'

end
)(l_0_9) == nil or (function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_12
  local l_1_1 = {}
  for l_1_5,l_1_6 in ipairs(l_1_0) do
    if type(l_1_6) == "table" then
      local l_1_7 = l_1_6.Certificates
      if l_1_7 ~= nil and type(l_1_7) == "table" then
        for l_1_11,l_1_12 in ipairs(l_1_7) do
          if type(l_1_12) == "table" then
            local l_1_13 = l_1_12.Subject
            if l_1_13 ~= nil and type(l_1_13) == "table" and l_1_13.Organization ~= nil then
              local l_1_14 = (mp.utf16to8)(l_1_13.Organization)
              if l_1_14 ~= nil and l_1_14 ~= "" then
                local l_1_15 = #l_1_1 + 1
                l_1_1[l_1_15] = (string.lower)(l_1_14)
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
  local l_1_16 = nil
  for l_1_20,l_1_21 in l_1_16 do
    local l_1_21 = nil
    -- DECOMPILER ERROR at PC75: Overwrote pending register: R8 in 'AssignReg'

    l_1_21 = l_1_21("|" .. (table.concat)(l_1_1, "|") .. "|", l_1_19, 1, true)
    if l_1_21 ~= nil then
      return l_1_20
    end
  end
  -- DECOMPILER ERROR at PC86: Overwrote pending register: R3 in 'AssignReg'

  do return l_1_16 end
  -- DECOMPILER ERROR at PC88: Confused about usage of register R3 for local variables in 'ReleaseLocals'

end
)(l_0_9) == "" then
  return mp.CLEAN
end
local l_0_15 = nil
-- DECOMPILER ERROR at PC192: Overwrote pending register: R13 in 'AssignReg'

local l_0_16 = l_0_8 .. "+empty"
-- DECOMPILER ERROR at PC200: Confused about usage of register: R11 in 'UnsetPending'

if l_0_16 == nil or l_0_16 == "" or l_0_8 .. "+" .. "\\manageengine\\uems_agent\\compliance\\" == nil or l_0_8 .. "+" .. "\\manageengine\\uems_agent\\compliance\\" == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC208: Overwrote pending register: R14 in 'AssignReg'

-- DECOMPILER ERROR at PC209: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC210: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC212: Overwrote pending register: R17 in 'AssignReg'

local l_0_17 = nil
do
  local l_0_18 = (crypto.CRC32Buffer)(-1, "\\manageengine\\uems_agent\\client-data\\vulnerable-resources\\", "\\manageengine\\uems_agent\\bin\\compvulndetection.exe", (("\\manageengine\\uems_agent\\bin\\secaddoncrashanalyser.exe").len)("\\manageengine\\adauditplusagent\\"))
  if l_0_18 == nil or (crypto.Sha1Buffer)(l_0_17, 0, (string.len)(l_0_17)) == nil or (crypto.Sha1Buffer)(l_0_17, 0, (string.len)(l_0_17)) == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC241: Overwrote pending register: R18 in 'AssignReg'

  if (MpCommon.NidSearch)(l_0_10, l_0_18) == true and l_0_10 == l_0_11 and ((MpCommon.SNidSearch)(l_0_10, "\\zoho corp\\adselfservice plus client software\\") ~= true or l_0_10 ~= l_0_11) then
    return mp.INFECTED
  end
  do return mp.CLEAN end
  -- DECOMPILER ERROR at PC257: freeLocal<0 in 'ReleaseLocals'

  -- WARNING: undefined locals caused missing assignments!
end

