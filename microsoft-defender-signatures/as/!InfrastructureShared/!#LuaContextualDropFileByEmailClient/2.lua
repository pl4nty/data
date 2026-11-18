-- Threat: !InfrastructureShared
-- Name: !#//Lua:ContextualDropFileByEmailClient
-- Type: 13
-- Includes: GetEmailPaths
-- MpAttributes: MpOnCloseNewlyCreatedHintRtpScan

function ParseISOHeader(l_1_0)
  mp.readprotection(false)
  
  local l_1_1 = mp.readfile(32768, 16)
  if l_1_1:find("\001CD001\001", 1, true) ~= 1 then
    return mp.CLEAN
  end
  local l_1_2 = mp.readu_u32(mp.readfile(32926, 4), 1)
  local l_1_3 = l_1_2 * 2048
  if l_1_3 > l_1_0 - 4 then
    return mp.CLEAN
  end
  local l_1_4 = mp.readfile(l_1_3, 4)
  local l_1_5 = string.byte(l_1_4, 1)
  if l_1_3 + l_1_5 > l_1_0 - 4 then
    return mp.CLEAN
  end
  local l_1_6 = mp.readfile(l_1_3 + l_1_5, 4)
  local l_1_7 = string.byte(l_1_6, 1)
  if l_1_3 + l_1_5 + l_1_7 > l_1_0 - 4 then
    return mp.CLEAN
  end
  local l_1_8 = mp.readfile(l_1_3 + l_1_5 + l_1_7, 4)
  local l_1_9 = string.byte(l_1_8, 1)
  if l_1_3 + l_1_5 + l_1_7 + l_1_9 > l_1_0 - 4 then
    return mp.CLEAN
  end
  local l_1_10 = mp.readfile(l_1_3 + l_1_5 + l_1_7 + l_1_9, 4)
  local l_1_11 = string.byte(l_1_10, 1)
  if l_1_11 ~= 0 then
    return mp.CLEAN
  end
  local l_1_12 = l_1_9 * 2048
  if l_1_12 > l_1_0 - 4 then
    return mp.CLEAN
  end
  local l_1_13 = mp.readfile(l_1_12, 4)
  local l_1_14 = string.byte(l_1_13, 1)
  if l_1_14 == 34 then
    return mp.CLEAN
  end
  if l_1_12 + l_1_14 > l_1_0 - 4 then
    return mp.CLEAN
  end
  local l_1_15 = mp.readfile(l_1_12 + l_1_14, 4)
  local l_1_16 = string.byte(l_1_15, 1)
  if l_1_14 == l_1_16 then
    return mp.CLEAN
  end
  if l_1_3 + l_1_5 + l_1_7 + 32 > l_1_0 - 4 then
    return mp.CLEAN
  end
  local l_1_17 = mp.readfile(l_1_3 + l_1_5 + l_1_7 + 32, 4)
  local l_1_18 = string.byte(l_1_17, 1)
  if l_1_18 < 3 or 255 < l_1_18 then
    return mp.CLEAN
  end
  if l_1_0 < l_1_3 + l_1_5 + l_1_7 + 33 then
    return mp.CLEAN
  end
  local l_1_19 = mp.readfile(l_1_3 + l_1_5 + l_1_7 + 33, l_1_18)
  l_1_19 = string.gsub(l_1_19, ";1", "", 1)
  local l_1_20 = ""
  local l_1_21 = ""
  if 4 < l_1_18 then
    l_1_20 = string.lower(string.sub(l_1_19, -4))
  end
  if 3 < l_1_18 then
    l_1_21 = string.lower(string.sub(l_1_19, -3))
  end
  local l_1_22 = {
    [".vbs"] = "VBS",
    [".lnk"] = "LNK",
    [".wsf"] = "WSF",
    [".vbe"] = "VBE",
    [".jse"] = "JSE",
    [".hta"] = "HTA",
    [".exe"] = "EXE",
    [".dll"] = "DLL",
    [".com"] = "COM",
    [".scr"] = "SCR",
    [".pif"] = "PIF",
    [".ps1"] = "PS",
    [".bat"] = "BAT",
    [".js"] = "JS"
  }
  local l_1_23 = l_1_22[l_1_20]
  local l_1_24 = l_1_22[l_1_21]
  local l_1_25 = {
    [".zip"] = "ZIP",
    [".rar"] = "RAR",
    [".ace"] = "ACE",
    [".iso"] = "ISO",
    [".arj"] = "ARJ",
    [".7z"] = "7Z",
    [".gz"] = "GZIP"
  }
  local l_1_26 = l_1_25[l_1_20]
  local l_1_27 = l_1_25[l_1_21]
  if l_1_23 ~= nil then
    mp.set_mpattribute("Lua:SingleExecExtensionInISOFromEmail")
    mp.set_mpattribute("Lua:Single" .. l_1_23 .. "InISOFromEmail")
  elseif l_1_24 ~= nil then
    mp.set_mpattribute("Lua:SingleExecExtensionInISOFromEmail")
    mp.set_mpattribute("Lua:Single" .. l_1_24 .. "InISOFromEmail")
  elseif l_1_26 ~= nil then
    mp.set_mpattribute("Lua:SingleArchiveExtensionInISOFromEmail")
    mp.set_mpattribute("Lua:Single" .. l_1_26 .. "InISOFromEmail")
  elseif l_1_27 ~= nil then
    mp.set_mpattribute("Lua:SingleArchiveExtensionInISOFromEmail")
    mp.set_mpattribute("Lua:Single" .. l_1_27 .. "InISOFromEmail")
  end
end

local l_0_0 = mp.get_mpattribute("Lua:ISOExt") or mp.get_mpattribute("Lua:ISOFileFound") or mp.get_mpattribute("Lua:LNKinISOFound") or mp.get_mpattribute("BM_ISO_FILE")
local l_0_1 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionInZip")
local l_0_2 = mp.get_mpattribute("Lua:RarHasFileWithExeExtension")
local l_0_3 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionIn7z")
local l_0_4 = mp.get_mpattribute("Lua:SingleSuspiciousExtensionInACE")
local l_0_5 = mp.get_mpattribute("BM_PDF_FILE")
local l_0_6 = mp.get_mpattribute("Lua:JARExt")
local l_0_7 = mp.get_mpattribute("MHSTR:MacroInside")
local l_0_8 = mp.getfilesize()
if (l_0_8 <= 4194304 and (l_0_1 or l_0_2 or l_0_3 or l_0_4) or l_0_8 <= 2097152 and l_0_0 or 307200 <= l_0_8 and l_0_8 <= 1048576 and l_0_6 or l_0_8 <= 820000 and l_0_5 or l_0_7) and mp.SCANREASON_ONMODIFIEDHANDLECLOSE == mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) and mp.get_contextdata(mp.CONTEXT_DATA_NEWLYCREATEDHINT) == true then
  local l_0_9 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME))
  local l_0_10 = string.lower(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
  local l_0_11 = getCachePaths(l_0_9)
  if l_0_11 ~= nil then
    for l_0_12, l_0_13 in pairs(l_0_11) do
      if l_0_10:find(l_0_13, 1, true) ~= nil then
        if l_0_1 == true or l_0_2 == true or l_0_3 == true or l_0_4 == true then
          mp.set_mpattribute("MpForceScanArchives")
        end
        if l_0_6 == true then
          mp.set_mpattribute("Lua:ContextJarFromEmailClient")
        end
        if l_0_0 == true then
          ParseISOHeader(l_0_8)
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
