-- Threat: !InfrastructureShared
-- Name: !#Lua:JSEMU_WscriptCscriptContext
-- Type: 12

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_ONOPEN then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_0:sub(-3):lower() ~= ".js" then
  return mp.CLEAN
end
local l_0_1 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME):lower()
local l_0_2 = l_0_1:match("[^\\]+$")
local l_0_3 = {
  ["iexplore.exe"] = "",
  ["chrome.exe"] = "",
  ["firefox.exe"] = ""
}
if l_0_2 == nil or l_0_3[l_0_2] then
  return mp.CLEAN
end
if l_0_2 == "wscript.exe" or l_0_2 == "cscript.exe" then
  return mp.INFECTED
end
if not l_0_0:find("^%l+%.js") then
  return mp.CLEAN
end

function string_starts(l_1_0, l_1_1)
  return string.sub(l_1_0, 1, string.len(l_1_1)) == l_1_1
end

function IsWscriptCopyMadeByBondat(l_2_0)
  local l_2_1 = {
    "win",
    "cmd",
    "disk",
    "dsk",
    "ms",
    "hp",
    "intel",
    "amd",
    "dll",
    "tcp",
    "udp"
  }
  local l_2_2 = {
    "process",
    "proc",
    "monitor",
    "mon",
    "sys",
    "host",
    "mgr",
    "update",
    "updater"
  }
  local l_2_3 = {
    "64.exe",
    "32.exe",
    ".exe"
  }
  local l_2_4 = #l_2_1
  local l_2_5 = #l_2_2
  local l_2_6 = #l_2_3
  for l_2_7 = 1, l_2_4 do
    if string_starts(l_2_0, l_2_1[l_2_7]) then
      for l_2_8 = 1, l_2_5 do
        if string_starts(string.sub(l_2_0, string.len(l_2_1[l_2_7]) + 1), l_2_2[l_2_8]) then
          for l_2_9 = 1, l_2_6 do
            if string.sub(l_2_0, string.len(l_2_1[l_2_7]) + string.len(l_2_2[l_2_8]) + 1) == l_2_3[l_2_9] then
              return true
            end
          end
        end
      end
    end
  end
  return false
end

if IsWscriptCopyMadeByBondat(l_0_2) == true then
  local l_0_4 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH)):lower()
  if l_0_1:find("\\appdata\\roaming\\%l+\\%l+[63]?[42]?%.exe$") and (l_0_4:find("\\appdata\\roaming\\%l+$") or l_0_4:find("\\%.trashes\\%d+$")) then
    mp.set_mpattribute("Lua:BondatContextualWscriptRunWithPath_GenFirst")
    return mp.INFECTED
  end
  local l_0_5 = {
    ["dllhost.exe"] = "",
    ["winprocess.exe"] = "",
    ["winupdate32.exe"] = "",
    ["winhost32.exe"] = "",
    ["msupdate.exe"] = "",
    ["winupdate.exe"] = "",
    ["mshost.exe"] = ""
  }
  if not l_0_5[l_0_2] then
    mp.set_mpattribute("Lua:BondatContextualWscriptRun")
    return mp.INFECTED
  end
end
return mp.CLEAN
