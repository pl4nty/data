-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\f5b387392f85\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
if (bm.GetSignatureMatchDuration)() > 100000000 then
  return mp.CLEAN
end
local l_0_1 = ((bm.get_imagepath)()):lower()
if l_0_1 ~= nil and l_0_1 ~= "" and IsExcludedByImagePath(l_0_1) then
  return mp.CLEAN
end
local l_0_2 = (bm.get_current_process_startup_info)()
if l_0_2 ~= nil and l_0_2.ppid ~= nil and isParentPackageManager(l_0_2.ppid, true) then
  return mp.CLEAN
end
local l_0_3 = {}
-- DECOMPILER ERROR at PC49: No list found for R3 , SetList fails

local l_0_4 = {}
-- DECOMPILER ERROR at PC51: Overwrote pending register: R5 in 'AssignReg'

-- DECOMPILER ERROR at PC52: Overwrote pending register: R6 in 'AssignReg'

-- DECOMPILER ERROR at PC53: Overwrote pending register: R7 in 'AssignReg'

for l_0_8 = "/usr/bin/", "/sbin/", "/usr/sbin/" do
  local l_0_9 = 0
  if (sigattr_tail[l_0_8]).attribute == 16385 then
    local l_0_10 = ((sigattr_tail[l_0_8]).utf8p1):lower()
    for l_0_14,l_0_15 in pairs(l_0_3) do
      if l_0_10:find(l_0_15) ~= nil then
        l_0_9 = 1
        break
      end
    end
    do
      do
        if l_0_9 == 0 then
          l_0_4[(mp.crc32)(0, l_0_10, 1, #l_0_10)] = 1
        end
        -- DECOMPILER ERROR at PC89: LeaveBlock: unexpected jumping out DO_STMT

        -- DECOMPILER ERROR at PC89: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC89: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
  end
end
do
  local l_0_16 = {}
  for l_0_20 = 1, l_0_0 do
    if (sigattr_tail[l_0_20]).attribute == 16386 then
      local l_0_21 = ((sigattr_tail[l_0_20]).utf8p2):lower()
      local l_0_22 = ((sigattr_tail[l_0_20]).utf8p1):lower()
      local l_0_23 = (mp.crc32)(0, l_0_21, 1, #l_0_21)
      local l_0_24 = (mp.crc32)(0, l_0_22, 1, #l_0_22)
      if l_0_4[l_0_24] ~= nil or l_0_4[l_0_23] ~= nil then
        local l_0_25 = l_0_21:match("%.[^%.]+$")
        if l_0_25 ~= nil and #l_0_21 < #l_0_22 and l_0_22:byte(#l_0_21 + 1) == 46 and l_0_22:find(l_0_21, 1, true) == 1 then
          local l_0_26 = (string.sub)(l_0_22, #l_0_21 + 1)
          if l_0_26 ~= nil and IsExcludedByImagePathFileExtension(l_0_1, l_0_26) == false and IsExcludedByImagePathFileExtensionRegEx(l_0_1, l_0_26) == false and IsExcludedByImagePathFileExtensionSuffix(l_0_1, l_0_26) == false and IsExtensionDatePattern(l_0_26) == false then
            if l_0_16[l_0_26] ~= nil then
              (table.insert)(l_0_16[l_0_26], l_0_20)
              if #l_0_16[l_0_26] >= 5 then
                TrackPidAndTechniqueBM("BM", "T1486", "Impact_Ransom")
                return mp.INFECTED
              end
            else
              local l_0_27 = {}
              -- DECOMPILER ERROR at PC206: No list found for R16 , SetList fails

            end
          end
        end
      end
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

