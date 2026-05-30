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
-- DECOMPILER ERROR at PC55: No list found for R2 , SetList fails

-- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

-- DECOMPILER ERROR at PC57: Overwrote pending register: R4 in 'AssignReg'

for l_0_6,l_0_7 in ("\\avecto\\privilege guard client\\")("\\system32\\pmlauncher.exe") do
  -- DECOMPILER ERROR at PC60: Overwrote pending register: R8 in 'AssignReg'

  -- DECOMPILER ERROR at PC62: Overwrote pending register: R9 in 'AssignReg'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R10 in 'AssignReg'

  -- DECOMPILER ERROR at PC64: Overwrote pending register: R11 in 'AssignReg'

  if (("\\desktopcentral_agent\\edr\\").find)("\\zoho corp\\adselfservice plus client software\\", "\\datto backup agent\\", "\\datto cloud continuity\\", true) then
    return mp.CLEAN
  end
end
local l_0_8 = getOrgIdScrubbed()
if l_0_8 == nil or l_0_8 == "" then
  return mp.CLEAN
end
local l_0_9 = (mp.GetCertificateInfo)()
if l_0_9 == nil or type(l_0_9) ~= "table" or #l_0_9 == 0 then
  return mp.CLEAN
end
local l_0_10 = 231
local l_0_11 = "!#OrgSignerRmmNormal"
local l_0_12 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 == nil then
    return nil
  end
  local l_1_1 = (string.lower)(l_1_0)
  if (string.find)(l_1_1, "action1", 1, true) then
    return "action1"
  end
  if (string.find)(l_1_1, "anydesk", 1, true) or (string.find)(l_1_1, "philandro software", 1, true) then
    return "anydesk"
  end
  if (string.find)(l_1_1, "atera", 1, true) then
    return "atera"
  end
  if (string.find)(l_1_1, "beyondtrust", 1, true) or (string.find)(l_1_1, "bomgar", 1, true) then
    return "beyondtrust"
  end
  if (string.find)(l_1_1, "connectwise", 1, true) or (string.find)(l_1_1, "screenconnect", 1, true) then
    return "screenconnect"
  end
  if (string.find)(l_1_1, "goto", 1, true) or (string.find)(l_1_1, "logmein", 1, true) then
    return "goto"
  end
  if (string.find)(l_1_1, "kaseya", 1, true) or (string.find)(l_1_1, "datto", 1, true) then
    return "kaseya"
  end
  if (string.find)(l_1_1, "meshcentral", 1, true) then
    return "meshcentral"
  end
  if (string.find)(l_1_1, "n-able", 1, true) then
    return "n-able"
  end
  if (string.find)(l_1_1, "netsupport", 1, true) then
    return "netsupport"
  end
  if (string.find)(l_1_1, "ninjaone", 1, true) or (string.find)(l_1_1, "ninjarmm", 1, true) then
    return "ninjaone"
  end
  if (string.find)(l_1_1, "nomachine", 1, true) then
    return "nomachine"
  end
  if (string.find)(l_1_1, "open source developer, huabing zhou", 1, true) or (string.find)(l_1_1, "purslane", 1, true) then
    return "purslane"
  end
  if (string.find)(l_1_1, "realvnc", 1, true) then
    return "realvnc"
  end
  if (string.find)(l_1_1, "remote utilities", 1, true) then
    return "remote utilities"
  end
  if (string.find)(l_1_1, "servably", 1, true) then
    return "servably"
  end
  if (string.find)(l_1_1, "simplehelp", 1, true) then
    return "simplehelp"
  end
  if (string.find)(l_1_1, "splashtop", 1, true) then
    return "splashtop"
  end
  if (string.find)(l_1_1, "teamviewer", 1, true) then
    return "teamviewer"
  end
  if (string.find)(l_1_1, "tsplus", 1, true) then
    return "tsplus"
  end
  if (string.find)(l_1_1, "zoho", 1, true) then
    return "zoho"
  end
  return nil
end

local l_0_13 = function(l_2_0)
  -- function num : 0_1
  for l_2_4,l_2_5 in ipairs(l_2_0) do
    if type(l_2_5) == "table" then
      local l_2_6 = l_2_5.Certificates
      if l_2_6 ~= nil and type(l_2_6) == "table" then
        for l_2_10,l_2_11 in ipairs(l_2_6) do
          if type(l_2_11) == "table" then
            local l_2_12 = l_2_11.Subject
            if l_2_12 ~= nil and type(l_2_12) == "table" and l_2_12.Organization ~= nil then
              local l_2_13 = (mp.utf16to8)(l_2_12.Organization)
              if l_2_13 ~= nil and l_2_13 ~= "" then
                local l_2_14 = string.lower
                local l_2_15 = l_2_13
                do return l_2_14(l_2_15) end
                -- DECOMPILER ERROR at PC50: Confused about usage of register R15 for local variables in 'ReleaseLocals'

              end
            end
          end
        end
      end
    end
  end
  do return nil end
  -- DECOMPILER ERROR at PC56: Confused about usage of register R14 for local variables in 'ReleaseLocals'

end

local l_0_14 = l_0_13(l_0_9)
if l_0_14 == nil or l_0_14 == "" then
  return mp.CLEAN
end
local l_0_15 = l_0_12(l_0_14)
if l_0_15 == nil or l_0_15 == "" then
  return mp.CLEAN
end
local l_0_16 = l_0_8 .. "+empty"
-- DECOMPILER ERROR at PC132: Overwrote pending register: R13 in 'AssignReg'

-- DECOMPILER ERROR at PC133: Overwrote pending register: R14 in 'AssignReg'

local l_0_17 = l_0_8 .. "\\datto\\workplace2\\" .. "\\gotomeeting\\"
if l_0_16 == nil or l_0_16 == "" or l_0_17 == nil or l_0_17 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC149: Overwrote pending register: R15 in 'AssignReg'

-- DECOMPILER ERROR at PC150: Overwrote pending register: R16 in 'AssignReg'

-- DECOMPILER ERROR at PC151: Overwrote pending register: R17 in 'AssignReg'

-- DECOMPILER ERROR at PC153: Overwrote pending register: R18 in 'AssignReg'

local l_0_18 = (crypto.CRC32Buffer)(-1, "\\zoho\\zohoworkdrivets\\", "\\gotomypc\\", (("\\gotomypcwebaccess\\").len)("\\netsupport\\netsupport notify\\"))
local l_0_19 = (crypto.Sha1Buffer)(l_0_17, 0, (string.len)(l_0_17))
if l_0_18 == nil or l_0_19 == nil or l_0_19 == "" then
  return mp.CLEAN
end
-- DECOMPILER ERROR at PC182: Overwrote pending register: R19 in 'AssignReg'

if (MpCommon.NidSearch)(l_0_10, l_0_18) == true and l_0_10 == l_0_11 and ((MpCommon.SNidSearch)(l_0_10, "\\packages\\plugins\\site24x7.") ~= true or l_0_10 ~= l_0_11) then
  return mp.INFECTED
end
return mp.CLEAN

