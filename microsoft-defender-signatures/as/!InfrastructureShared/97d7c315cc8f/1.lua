-- Threat: !InfrastructureShared
-- Name: 97d7c315cc8f
-- Type: 21

local l_0_0 = {
  ["\225\181\131"] = "a",
  ["\225\181\135"] = "b",
  ["\225\182\156"] = "c",
  ["\225\181\136"] = "d",
  ["\225\181\137"] = "e",
  ["\225\182\160"] = "f",
  ["\225\181\141"] = "g",
  ["\202\176"] = "h",
  ["\226\129\177"] = "i",
  ["\202\178"] = "j",
  ["\225\181\143"] = "k",
  ["\203\161"] = "l",
  ["\225\181\144"] = "m",
  ["\226\129\191"] = "n",
  ["\225\181\146"] = "o",
  ["\225\181\150"] = "p",
  ["\202\179"] = "r",
  ["\203\162"] = "s",
  ["\225\181\151"] = "t",
  ["\225\181\152"] = "u",
  ["\225\181\155"] = "v",
  ["\202\183"] = "w",
  ["\203\163"] = "x",
  ["\202\184"] = "y",
  ["\225\182\187"] = "z",
  ["\225\180\172"] = "A",
  ["\225\180\174"] = "B",
  ["\225\180\176"] = "D",
  ["\225\180\177"] = "E",
  ["\225\180\179"] = "G",
  ["\225\180\180"] = "H",
  ["\225\180\181"] = "I",
  ["\225\180\182"] = "J",
  ["\225\180\183"] = "K",
  ["\225\180\184"] = "L",
  ["\225\180\185"] = "M",
  ["\225\180\186"] = "N",
  ["\225\180\188"] = "O",
  ["\225\180\190"] = "P",
  ["\225\180\191"] = "R",
  ["\225\181\128"] = "T",
  ["\225\181\129"] = "U",
  ["\225\181\130"] = "W",
  ["\224\173\186"] = "",
  ["\224\175\145"] = "",
  ["\225\177\139"] = "",
  ["\225\161\188"] = "",
  ["\225\170\190"] = "",
  ["\225\159\172"] = "",
  ["\224\183\183"] = "",
  ["\224\167\154"] = "",
  ["\224\161\180"] = "",
  ["\224\161\186"] = "",
  ["\226\145\151"] = "",
  ["\226\145\153"] = "",
  ["\224\185\176"] = "",
  ["\226\174\160"] = "",
  ["\226\184\185"] = "",
  ["\224\185\167"] = "",
  ["\224\178\129"] = ""
}
local l_0_1 = {
  ["certutil.exe"] = {
    "urlcache",
    "split",
    "-f",
    "http",
    "getconfig"
  },
  ["reg.exe"] = {"save"},
  ["msiexec.exe"] = {
    "quiet",
    "forcerestart"
  },
  ["schtasks.exe"] = {
    "create",
    "monthly",
    "/tn"
  },
  cmstp = {
    "/ns",
    "/nf",
    "/sd",
    "/au"
  }
}

function replaceUnicodeWithAscii(l_1_0)
  local l_1_1 = l_1_0
  for l_1_2, l_1_3 in pairs(l_0_0) do
    l_1_1 = l_1_1:gsub(l_1_2, l_1_3)
  end
  return l_1_1
end

local l_0_2 = mp.GetScannedPPID()
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.GetProcessCommandLine(l_0_2)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = string.lower(l_0_3)
local l_0_5 = MpCommon.GetImagePathFromPid(l_0_2)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = string.lower(l_0_5:match("([^\\]+)$"))
if not l_0_6 then
  return mp.CLEAN
end
if l_0_1[l_0_6] then
  local l_0_7 = l_0_1[l_0_6]
  local l_0_8 = replaceUnicodeWithAscii(l_0_3)
  if not l_0_8 then
    return mp.CLEAN
  end
  l_0_8 = string.lower(l_0_8)
  for l_0_9, l_0_10 in ipairs(l_0_7) do
    if string.find(l_0_8, l_0_10) and not string.find(l_0_4, l_0_10) then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
