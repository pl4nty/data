-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\_!AppDomainManagerTypeAM\Includes\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.getfilename)((mp.bitor)(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if isnull(l_0_0) then
  return mp.CLEAN
end
l_0_0 = normalize_path(l_0_0)
if isnull(l_0_0) or not (string.find)(l_0_0, "%.exe%.config$") then
  return mp.CLEAN
end
local l_0_1 = {}
-- DECOMPILER ERROR at PC46: No list found for R1 , SetList fails

-- DECOMPILER ERROR at PC47: Overwrote pending register: R2 in 'AssignReg'

-- DECOMPILER ERROR at PC48: Overwrote pending register: R3 in 'AssignReg'

for l_0_5,l_0_6 in ((MpCommon.ExpandEnvironmentVariables)("%ProgramFiles%"))((MpCommon.ExpandEnvironmentVariables)("%ProgramFiles(x86)%")) do
  if not isnull(l_0_6) then
    local l_0_7 = normalize_path(l_0_6)
    if not isnull(l_0_7) and (string.sub)(l_0_0, 1, #l_0_7 + 1) == l_0_7 .. "\\" then
      return mp.CLEAN
    end
  end
end
local l_0_8 = (string.match)(l_0_0, "^(.*)\\[^\\]+$")
local l_0_9 = math_min(10000, (mp.getfilesize)() or 0)
if isnull(l_0_8) or l_0_9 == 0 then
  return mp.CLEAN
end
;
(mp.readprotection)(false)
local l_0_10 = (mp.readfile)(0, l_0_9)
;
(mp.readprotection)(true)
if isnull(l_0_10) then
  return mp.CLEAN
end
l_0_10 = (string.lower)(tostring(l_0_10))
local l_0_11 = (string.match)(l_0_10, "<appdomainmanagerassembly%s+value%s*=%s*\"([^\"\r\n,]+)")
if isnull(l_0_11) then
  return mp.CLEAN
end
l_0_11 = (string.match)(l_0_11, "^%s*(.-)%s*$")
if isnull(l_0_11) or l_0_11 == "" then
  return mp.CLEAN
end
l_0_11 = (string.gsub)(l_0_11, "/", "\\")
local l_0_12 = {}
if (string.find)(l_0_11, "%.dll$") or (string.find)(l_0_11, "%.exe$") then
  l_0_12[1] = l_0_11
else
  l_0_12[1] = l_0_11 .. ".dll"
  l_0_12[2] = l_0_11 .. ".exe"
end
local l_0_13 = {}
-- DECOMPILER ERROR at PC196: No list found for R7 , SetList fails

-- DECOMPILER ERROR at PC197: Overwrote pending register: R8 in 'AssignReg'

local l_0_14 = (l_0_8.match)(l_0_10, "<probing[^>]-privatepath%s*=%s*\"([^\"\r\n]+)")
if not isnull(l_0_14) then
  for l_0_18 in (string.gmatch)(l_0_14 .. ";", "([^;]+);") do
    local l_0_19 = (string.match)(l_0_18, "^%s*(.-)%s*$")
    local l_0_20 = string.gsub
    l_0_20 = l_0_20(l_0_19 or "", "/", "\\")
    l_0_19 = l_0_20
    while 1 do
      l_0_20 = string
      l_0_20 = l_0_20.sub
      l_0_20 = l_0_20(l_0_19, 1, 2)
      if l_0_20 == ".\\" then
        l_0_20 = string
        l_0_20 = l_0_20.sub
        l_0_20 = l_0_20(l_0_19, 3)
        l_0_19 = l_0_20
        -- DECOMPILER ERROR at PC243: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC243: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    if l_0_19 ~= "" then
      l_0_20 = nil
      if (string.match)(l_0_19, "^%a:\\") or (string.sub)(l_0_19, 1, 2) == "\\\\" then
        l_0_20 = l_0_19
      else
        if (string.sub)(l_0_19, 1, 1) == "\\" and (string.match)(l_0_8, "^(%a:)") then
          l_0_20 = (string.match)(l_0_8, "^(%a:)") .. l_0_19
        end
      end
      l_0_20 = l_0_8 .. "\\" .. l_0_19
      if not isnull(l_0_20) then
        l_0_20 = normalize_path(l_0_20)
        while 1 do
          if not isnull(l_0_20) then
            if #l_0_20 > 3 and (string.sub)(l_0_20, -1) == "\\" then
              l_0_20 = (string.sub)(l_0_20, 1, -2)
              -- DECOMPILER ERROR at PC318: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC318: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC318: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC318: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
        l_0_13[#l_0_13 + 1] = l_0_20
      end
    end
  end
end
do
  local l_0_22 = nil
  local l_0_23 = "AppDomainManagerRelationAM"
  local l_0_24 = "PendingAssemblies"
  local l_0_25 = "RecentAssemblies"
  local l_0_26 = 86400
  local l_0_27 = {}
  do
    for l_0_32,l_0_33 in ipairs(l_0_12) do
      local l_0_29, l_0_30 = {}, function(l_1_0)
  -- function num : 0_0 , upvalues : l_0_27, l_0_26
  l_1_0 = normalize_path(l_1_0)
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R1 in 'UnsetPending'

  if not isnull(l_1_0) and not l_0_27[l_1_0] then
    l_0_27[l_1_0] = true
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R1 in 'UnsetPending'

    l_0_26[#l_0_26 + 1] = l_1_0
  end
end

      -- DECOMPILER ERROR at PC339: Confused about usage of register: R20 in 'UnsetPending'

      if (string.match)(R20_PC339, "^%a:\\") or (string.sub)(R20_PC339, 1, 2) == "\\\\" then
        l_0_30(R20_PC339)
      else
        for l_0_37,l_0_38 in ipairs(l_0_13) do
          -- DECOMPILER ERROR at PC361: Confused about usage of register: R25 in 'UnsetPending'

          l_0_30(R25_PC361 .. "\\" .. l_0_35)
        end
      end
    end
    for l_0_42,l_0_43 in ipairs(l_0_27) do
      local l_0_39, l_0_40 = nil
      -- DECOMPILER ERROR at PC377: Confused about usage of register: R20 in 'UnsetPending'

      AppendToRollingQueueNamespaced(l_0_24, l_0_23, l_0_35, l_0_0, l_0_26, 256, 1)
      -- DECOMPILER ERROR at PC388: Confused about usage of register: R20 in 'UnsetPending'

      if (sysio.IsFileExists)(l_0_45) or pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_0_25, l_0_23, l_0_35) and not isnull(R24_PC400) then
        (mp.ReportLowfi)(R24_PC400, 1924697406)
        return mp.INFECTED
      end
    end
    do return mp.CLEAN end
    -- DECOMPILER ERROR at PC416: freeLocal<0 in 'ReleaseLocals'

  end
end

