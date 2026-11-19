-- Threat: !InfrastructureShared
-- Name: 171b3eea97f52
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0 = mp.SIGATTR_LOG_SZ
if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local l_0_1 = bm.get_imagepath():lower()
if l_0_1 ~= nil and l_0_1 ~= "" and IsExcludedByImagePath(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = bm.get_current_process_startup_info()
if l_0_2 ~= nil and l_0_2.ppid ~= nil and isParentPackageManager(l_0_2.ppid, true) then
  return mp.CLEAN
end
local l_0_3 = {
  "/bin/",
  "/usr/bin/",
  "/sbin/",
  "/usr/sbin/"
}
local l_0_4 = {}
for l_0_5 = 1, l_0_0 do
  local l_0_6 = 0
  if sigattr_tail[l_0_5].attribute == 16385 then
    local l_0_7 = sigattr_tail[l_0_5].utf8p1:lower()
    for l_0_8, l_0_9 in pairs(l_0_3) do
      if l_0_7:find(l_0_9) ~= nil then
        l_0_6 = 1
        break
      end
    end
    if l_0_6 == 0 then
      l_0_4[mp.crc32(0, l_0_7, 1, #l_0_7)] = 1
    end
  end
end
local l_0_10 = {}
for l_0_11 = 1, l_0_0 do
  if sigattr_tail[l_0_11].attribute == 16386 then
    local l_0_12 = sigattr_tail[l_0_11].utf8p2:lower()
    local l_0_13 = sigattr_tail[l_0_11].utf8p1:lower()
    local l_0_14 = mp.crc32(0, l_0_12, 1, #l_0_12)
    local l_0_15 = mp.crc32(0, l_0_13, 1, #l_0_13)
    if l_0_4[l_0_15] ~= nil or l_0_4[l_0_14] ~= nil then
      local l_0_16 = l_0_12:match("%.[^%.]+$")
      if l_0_16 ~= nil and #l_0_12 < #l_0_13 and l_0_13:byte(#l_0_12 + 1) == 46 and l_0_13:find(l_0_12, 1, true) == 1 then
        local l_0_17 = string.sub(l_0_13, #l_0_12 + 1)
        if l_0_17 ~= nil and IsExcludedByImagePathFileExtension(l_0_1, l_0_17) == false and IsExcludedByImagePathFileExtensionRegEx(l_0_1, l_0_17) == false and IsExcludedByImagePathFileExtensionSuffix(l_0_1, l_0_17) == false and IsExtensionDatePattern(l_0_17) == false then
          if l_0_10[l_0_17] ~= nil then
            table.insert(l_0_10[l_0_17], l_0_11)
            if 5 <= #l_0_10[l_0_17] then
              TrackPidAndTechniqueBM("BM", "T1486", "Impact_Ransom")
              return mp.INFECTED
            end
          else
            l_0_10[l_0_17] = {l_0_11}
          end
        end
      end
    end
  end
end
return mp.CLEAN
