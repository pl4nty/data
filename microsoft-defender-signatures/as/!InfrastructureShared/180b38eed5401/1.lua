-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\180b38eed5401\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = mp.SIGATTR_LOG_SZ
local l_0_1 = {}
local l_0_2 = {}
for l_0_6 = 1, l_0_0 do
  local l_0_7 = (sigattr_tail[l_0_6]).utf8p2
  if (sigattr_tail[l_0_6]).attribute == 16491 and l_0_7:find("filetype:unknown", 1, true) then
    local l_0_8 = {}
    for l_0_12,l_0_13 in (string.gmatch)(l_0_7, "(%w+):([^;]*)") do
      l_0_8[l_0_12] = l_0_13
    end
    if tonumber(l_0_8.entropy) >= 6 and l_0_8.filepath then
      local l_0_14 = (l_0_8.filepath):lower()
      if l_0_1[l_0_14] == nil then
        l_0_1[l_0_14] = l_0_6
        local l_0_15 = l_0_14:match("%.[^%.]+$")
        if l_0_15 and (mp.GetExtensionClass)(l_0_15) == 0 then
          if l_0_2[l_0_15] ~= nil then
            (table.insert)(l_0_2[l_0_15], l_0_14)
          else
            local l_0_16 = {}
            -- DECOMPILER ERROR at PC70: No list found for R11 , SetList fails

          end
        end
      end
    end
  end
end
local l_0_17 = {}
for l_0_21,l_0_22 in pairs(l_0_2) do
  if #l_0_22 >= 10 then
    for l_0_26,l_0_27 in pairs(l_0_22) do
      (table.insert)(l_0_17, l_0_27)
    end
  end
end
do
  do
    if #l_0_17 >= 10 then
      local l_0_28 = {}
      ;
      (bm.trigger_sig)("GenericRansomware:HighEntropyUnkFileMeta", safeJsonSerialize(l_0_28))
      return mp.INFECTED
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

