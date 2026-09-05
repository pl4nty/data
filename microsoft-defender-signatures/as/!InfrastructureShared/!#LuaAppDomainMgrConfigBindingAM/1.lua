-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LuaAppDomainMgrConfigBindingAM\1.luac 

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
if (string.match)(l_0_0, "^%a:\\program files\\") or (string.match)(l_0_0, "^%a:\\program files %(x86%)\\") then
  return mp.CLEAN
end
local l_0_1 = (string.match)(l_0_0, "^(.*)\\[^\\]+$")
do
  local l_0_2, l_0_3, l_0_4, l_0_5 = (mp.getfilesize)() or 0
  -- DECOMPILER ERROR at PC70: Confused about usage of register: R2 in 'UnsetPending'

  -- DECOMPILER ERROR at PC72: Confused about usage of register: R2 in 'UnsetPending'

  if isnull(l_0_1) or l_0_2 <= 0 or l_0_2 > 52428800 then
    return mp.CLEAN
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC85: Confused about usage of register: R2 in 'UnsetPending'

  local l_0_6, l_0_7 = , pcall(mp.readfile, 0, l_0_2)
  ;
  (mp.readprotection)(true)
  if not l_0_7 or isnull(R6_PC95) then
    return mp.CLEAN
  end
  local l_0_8 = nil
  local l_0_9 = (string.match)((string.lower)(R6_PC95(R7_PC105)), "<appdomainmanagerassembly[^>]-value%s*=%s*[\"\']([^\"\']+)[\"\']")
  if isnull(l_0_9) or isnull((string.match)(l_0_8, "<appdomainmanagertype[^>]-value%s*=%s*[\"\']([^\"\']+)[\"\']")) then
    return mp.CLEAN
  end
  local l_0_10 = nil
  l_0_10 = (function(l_1_0)
  -- function num : 0_0
  local l_1_1 = string.match
  local l_1_3 = l_1_0 or ""
  do return l_1_1(l_1_3, "^%s*(.-)%s*$") end
  -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

end
)(l_0_10)
  -- DECOMPILER ERROR at PC136: Confused about usage of register: R7 in 'UnsetPending'

  local l_0_11 = nil
  if l_0_10 == "" or (function(l_1_0)
  -- function num : 0_0
  local l_1_1 = string.match
  local l_1_3 = l_1_0 or ""
  do return l_1_1(l_1_3, "^%s*(.-)%s*$") end
  -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

end
)((string.match)(l_0_9, "^([^,]+)") or l_0_9) == "" then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC167: Confused about usage of register: R8 in 'UnsetPending'

  do
    local l_0_12 = nil
    local l_0_13 = nil
    if (string.gsub)((string.gsub)((string.match)((string.gsub)((function(l_1_0)
  -- function num : 0_0
  local l_1_1 = string.match
  local l_1_3 = l_1_0 or ""
  do return l_1_1(l_1_3, "^%s*(.-)%s*$") end
  -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

end
)((string.match)(l_0_9, "^([^,]+)") or l_0_9), "/", "\\"), "([^\\]+)$") or (string.gsub)((function(l_1_0)
  -- function num : 0_0
  local l_1_1 = string.match
  local l_1_3 = l_1_0 or ""
  do return l_1_1(l_1_3, "^%s*(.-)%s*$") end
  -- DECOMPILER ERROR at PC8: Confused about usage of register R2 for local variables in 'ReleaseLocals'

end
)((string.match)(l_0_9, "^([^,]+)") or l_0_9), "/", "\\"), "%.dll$", ""), "%.exe$", "") == "" then
      return mp.CLEAN
    end
    local l_0_14 = nil
    local l_0_15 = {}
    ;
    (function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_11, l_0_1, l_0_16, l_0_15
  local l_2_1 = l_0_11(l_2_0)
  l_2_1 = (string.gsub)(l_2_1, "/", "\\")
  while (string.sub)(l_2_1, 1, 2) == ".\\" do
    l_2_1 = (string.sub)(l_2_1, 3)
  end
  if l_2_1 == "" then
    return 
  end
  local l_2_2 = nil
  if (string.match)(l_2_1, "^%a:\\") or (string.sub)(l_2_1, 1, 2) == "\\\\" then
    l_2_2 = l_2_1
  else
    if (string.sub)(l_2_1, 1, 1) == "\\" then
      local l_2_3 = (string.match)(l_0_1, "^(%a:)")
      if l_2_3 then
        l_2_2 = l_2_3 .. l_2_1
      end
    else
      do
        l_2_2 = l_0_1 .. "\\" .. l_2_1
        if isnull(l_2_2) then
          return 
        end
        l_2_2 = normalize_path(l_2_2)
        if isnull(l_2_2) then
          return 
        end
        while #l_2_2 > 3 and (string.sub)(l_2_2, -1) == "\\" do
          l_2_2 = (string.sub)(l_2_2, 1, -2)
        end
        -- DECOMPILER ERROR at PC111: Confused about usage of register: R3 in 'UnsetPending'

        if #l_2_2 >= 3 and not l_0_16[l_2_2] then
          l_0_16[l_2_2] = true
          -- DECOMPILER ERROR at PC116: Confused about usage of register: R3 in 'UnsetPending'

          l_0_15[#l_0_15 + 1] = l_2_2
        end
      end
    end
  end
end
)(l_0_1)
    local l_0_17 = {}
    if not isnull((string.match)(l_0_8, "<probing[^>]-privatepath%s*=%s*[\"\']([^\"\']+)[\"\']")) then
      for l_0_21 in (string.gmatch)((string.match)(l_0_8, "<probing[^>]-privatepath%s*=%s*[\"\']([^\"\']+)[\"\']") .. ";", "([^;]+);") do
        local l_0_18, l_0_19 = nil
        -- DECOMPILER ERROR at PC216: Confused about usage of register: R17 in 'UnsetPending'

        l_0_18(R17_PC216)
      end
    end
    do
      local l_0_22 = nil
      local l_0_23 = nil
      local l_0_25 = {}
      if (string.find)(l_0_13, "%.dll$") or (string.find)(l_0_13, "%.exe$") then
        for l_0_29,l_0_30 in ipairs({[1] = l_0_13, [1] = l_0_13 .. ".dll", [2] = l_0_13 .. ".exe"}) do
          local l_0_26, l_0_27, l_0_28 = {}, function(l_3_0)
  -- function num : 0_2 , upvalues : l_0_24, l_0_23
  local l_3_1 = normalize_path(l_3_0)
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  if not isnull(l_3_1) and not l_0_24[l_3_1] then
    l_0_24[l_3_1] = true
    -- DECOMPILER ERROR at PC18: Confused about usage of register: R2 in 'UnsetPending'

    l_0_23[#l_0_23 + 1] = l_3_1
  end
end

          -- DECOMPILER ERROR at PC256: Confused about usage of register: R22 in 'UnsetPending'

          if (string.match)(R22_PC256, "^%a:\\") or (string.sub)(R22_PC256, 1, 2) == "\\\\" then
            l_0_27(R22_PC256)
          else
            for l_0_34,l_0_35 in ipairs(l_0_15) do
              -- DECOMPILER ERROR at PC278: Confused about usage of register: R27 in 'UnsetPending'

              l_0_27(R27_PC278 .. "\\" .. l_0_33)
            end
          end
        end
        for l_0_39 in (string.gmatch)(l_0_8, "<codebase[^>]-href%s*=%s*[\"\']([^\"\']+)[\"\']") do
          local l_0_36, l_0_37, l_0_38 = nil
          -- DECOMPILER ERROR at PC294: Confused about usage of register: R21 in 'UnsetPending'

          do
            do
              -- DECOMPILER ERROR at PC334: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC350: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC358: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC382: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC387: Confused about usage of register: R23 in 'UnsetPending'

              -- DECOMPILER ERROR at PC394: Confused about usage of register: R23 in 'UnsetPending'

              -- DECOMPILER ERROR at PC401: Confused about usage of register: R23 in 'UnsetPending'

              if (string.sub)((l_0_11(l_0_32)), 1, 5) ~= "file:" or ((((string.sub)((string.sub)((l_0_11(l_0_32)), 6), 1, 3) ~= "///" or not (string.match)((string.sub)((string.sub)((l_0_11(l_0_32)), 6), 4), "^%a:/") or (string.sub)((string.sub)((l_0_11(l_0_32)), 6), 1, 2) == "//") and (string.find)((l_0_11(l_0_32)), "://", 1, true)) or (string.gsub)(nil, "/", "\\")) then
                if (string.match)((string.gsub)(nil, "/", "\\"), "^%a:\\") or (string.sub)((string.gsub)(nil, "/", "\\"), 1, 2) == "\\\\" then
                  l_0_37((string.gsub)(nil, "/", "\\"))
                else
                  -- DECOMPILER ERROR at PC407: Confused about usage of register: R23 in 'UnsetPending'

                  l_0_37(l_0_1 .. "\\" .. (string.gsub)(nil, "/", "\\"))
                end
              end
              -- DECOMPILER ERROR at PC410: LeaveBlock: unexpected jumping out DO_STMT

            end
          end
        end
        local l_0_43 = nil
        local l_0_44 = nil
        local l_0_45 = nil
        local l_0_46 = "AppDomainManagerBoundLoaderV1"
        local l_0_47 = "PendingPath"
        local l_0_48 = "PendingBinding"
        local l_0_49 = "SeenPathAM"
        local l_0_50 = "SeenBindingAM"
        local l_0_51 = "SeenPathAN"
        local l_0_53 = "SeenBindingAN"
        do
          local l_0_54 = 86400
          for l_0_58,l_0_59 in ipairs(l_0_25) do
            local l_0_55, l_0_56, l_0_57, l_0_58 = 512, function(l_4_0, l_4_1)
  -- function num : 0_3 , upvalues : l_0_44
  if isnull(l_4_1) or l_4_1 == "" then
    return false
  end
  local l_4_2, l_4_3 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_4_0, l_0_44, l_4_1)
  if l_4_2 then
    do
      do return not isnull(l_4_3) end
      -- DECOMPILER ERROR at PC23: freeLocal<0 in 'ReleaseLocals'

    end
  end
end
, false, false
            -- DECOMPILER ERROR at PC432: Confused about usage of register: R34 in 'UnsetPending'

            AppendToRollingQueueNamespaced(l_0_47, l_0_46, R34_PC432, 1, l_0_54, l_0_55, 1)
            if l_0_56(l_0_49, R34_PC432) then
              l_0_57 = true
            end
            if l_0_56(l_0_51, R34_PC432) then
              l_0_58 = true
            end
          end
          for l_0_63,l_0_64 in ipairs(l_0_15) do
            local l_0_60, l_0_61, l_0_62, l_0_63 = nil
            -- DECOMPILER ERROR at PC460: Confused about usage of register: R34 in 'UnsetPending'

            AppendToRollingQueueNamespaced(l_0_48, l_0_46, l_0_14 .. "|" .. R34_PC432, 1, l_0_54, l_0_60, 1)
            -- DECOMPILER ERROR at PC473: Confused about usage of register: R35 in 'UnsetPending'

            if l_0_61(l_0_50, l_0_14 .. "|" .. R34_PC432) then
              l_0_62 = true
            end
            -- DECOMPILER ERROR at PC480: Confused about usage of register: R35 in 'UnsetPending'

            if l_0_61(l_0_53, l_0_14 .. "|" .. R34_PC432) then
              l_0_63 = true
            end
          end
          -- DECOMPILER ERROR at PC487: Confused about usage of register: R28 in 'UnsetPending'

          if l_0_62 then
            (mp.set_mpattribute)("Lua:AppDomainMgrLoaderManaged.AM")
          end
          -- DECOMPILER ERROR at PC493: Confused about usage of register: R29 in 'UnsetPending'

          if l_0_63 then
            (mp.set_mpattribute)("Lua:AppDomainMgrLoaderNative.AM")
          end
          do return mp.INFECTED end
          -- DECOMPILER ERROR at PC502: freeLocal<0 in 'ReleaseLocals'

        end
      end
    end
  end
end

