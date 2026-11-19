-- Threat: !InfrastructureShared
-- Name: !#Lua:LnkWithSuspIconsCC
-- Type: 13
-- Includes: BMLuaLib, LuaFuncHelper
-- MpAttributes: BM_LNK_FILE

if not mp.get_mpattribute("Lua:LNK_Settings!RunMinimized") and not mp.get_mpattribute("Lua:FileOnIsoRoot") then
  return mp.CLEAN
end
local l_0_0, l_0_1 = pcall(mp.GetLnkInfo)
if l_0_0 == false or l_0_1 == nil then
  return mp.CLEAN
end
local l_0_2 = l_0_1.Arguments or nil
local l_0_3 = l_0_1.BasePath or nil
local l_0_4 = l_0_1.RelativePath or nil
local l_0_5 = l_0_1.IconLocation or nil
local l_0_6 = l_0_1.IconIndex or nil
local l_0_7 = 0
if l_0_5 ~= nil then
  local l_0_8 = l_0_5:byte()
  if l_0_8 < 65 or 122 < l_0_8 then
    local l_0_9 = {
      string.byte(l_0_5, 1, #l_0_5)
    }
    for l_0_10 = 1, #l_0_9 do
      if 65 <= l_0_9[l_0_10] and l_0_9[l_0_10] <= 122 then
        l_0_7 = l_0_10
        break
      end
    end
  end
  if 1 <= l_0_7 then
    mp.set_mpattribute("NotReadableCharsInIcnLoc")
  end
  l_0_5 = l_0_5:match("\\([^\\]+)$"):lower()
  mp.set_mpattribute("//HasIconLocation!" .. l_0_5)
end
if l_0_6 ~= nil then
  mp.set_mpattribute("//HasIconIndex!" .. l_0_6)
end
local l_0_11 = {
  "odbcconf",
  "rundll32",
  "regsvr",
  "powershell",
  "calc",
  "wscript",
  "cscript",
  "mshta"
}
local l_0_12 = false
if l_0_4 ~= nil then
  l_0_4 = l_0_4:lower()
  if StringEndsWith(l_0_4, ".js") or StringEndsWith(l_0_4, ".cmd") or StringEndsWith(l_0_4, ".bat") or StringEndsWith(l_0_4, ".vbs") then
    l_0_12 = true
  end
end
if l_0_12 == false and l_0_2 ~= nil then
  l_0_2 = l_0_2:lower()
  if StringEndsWith(l_0_2, ".js") or StringEndsWith(l_0_2, ".cmd") or StringEndsWith(l_0_2, ".bat") or StringEndsWith(l_0_2, ".vbs") or contains(l_0_2, l_0_11) then
    l_0_12 = true
  end
end
if l_0_12 == false and l_0_3 ~= nil then
  l_0_3 = l_0_3:lower()
  if contains(l_0_3, l_0_11) then
    l_0_12 = true
  end
end
if l_0_12 == true then
  l_0_5 = l_0_5:match("\\([^\\]+)$"):lower()
  l_0_6 = l_0_6 + 1
  local l_0_13 = {
    [1] = {
      "explorer.exe",
      "write.exe",
      "zipfldr.dll"
    },
    [2] = "zipfldr.dll",
    [4] = "shell32.dll",
    [5] = "imageres.dll",
    [37] = "shell32.dll",
    [39] = "shell32.dll",
    [66] = "imageres.dll",
    [154] = "imageres.dll",
    [14] = "msedge.exe"
  }
  l_0_12 = false
  l_0_7 = l_0_7 - 1
  if type(l_0_13[l_0_6]) ~= "table" and l_0_13[l_0_6]:sub(1, #l_0_13[l_0_6] - l_0_7) == l_0_5 then
    l_0_12 = true
  elseif type(l_0_13[l_0_6]) == "table" then
    for l_0_14 = 1, #l_0_13[l_0_6] do
      if l_0_13[l_0_6][l_0_14]:sub(1, #l_0_13[l_0_6][l_0_14] - l_0_7) == l_0_5 then
        l_0_12 = true
        break
      end
    end
  end
  if l_0_12 == true then
    return mp.INFECTED
  end
end
return mp.CLEAN
