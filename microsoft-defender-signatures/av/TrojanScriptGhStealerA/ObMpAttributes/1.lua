-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\TrojanScriptGhStealerA\ObMpAttributes\1.luac 

-- params : ...
-- function num : 0
do
  if (mp.getfilesize)() > 153600 then
    local l_0_0, l_0_1, l_0_2, l_0_4, l_0_6, l_0_8 = 153600
  end
  ;
  (mp.readprotection)(false)
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  do
    local l_0_3, l_0_5, l_0_7, l_0_9 = , tostring((mp.readfile)(0, l_0_0)) or ""
    ;
    (mp.readprotection)(true)
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R1 in 'UnsetPending'

    if l_0_5 == "" then
      return mp.CLEAN
    end
    -- DECOMPILER ERROR at PC31: Confused about usage of register: R1 in 'UnsetPending'

    local l_0_10 = nil
    if (string.match)(l_0_5, "set%s+[+-]e[%s;]+echo%s+\"([A-Za-z0-9+/=\r\n]+)\"%s*|%s*base64%s+%-d") == nil or #(string.match)(l_0_5, "set%s+[+-]e[%s;]+echo%s+\"([A-Za-z0-9+/=\r\n]+)\"%s*|%s*base64%s+%-d") < 512 then
      return mp.CLEAN
    end
    local l_0_11 = nil
    if (MpCommon.Base64Decode)((string.match)(l_0_5, "set%s+[+-]e[%s;]+echo%s+\"([A-Za-z0-9+/=\r\n]+)\"%s*|%s*base64%s+%-d")) == nil then
      return mp.CLEAN
    end
    ;
    (mp.vfo_add_buffer)((MpCommon.Base64Decode)((string.match)(l_0_5, "set%s+[+-]e[%s;]+echo%s+\"([A-Za-z0-9+/=\r\n]+)\"%s*|%s*base64%s+%-d")), "[DecodedVFO]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    local l_0_12 = nil
    local l_0_13 = (string.lower)((MpCommon.Base64Decode)((string.match)(l_0_5, "set%s+[+-]e[%s;]+echo%s+\"([A-Za-z0-9+/=\r\n]+)\"%s*|%s*base64%s+%-d")))
    for l_0_17,l_0_18 in ipairs({"megalodon", "gh_dump", "gcp_access_token", "x%-mega%-did", "x%-mega%-plat", "/proc/%*%*/environ", "169%.254%.169%.254", "aws%s+sts%s+get%-caller%-identity", "gcloud%s+auth%s+print%-access%-token", "grep%s+%-rile"}) do
      local l_0_14, l_0_15 = , 0
      -- DECOMPILER ERROR at PC83: Confused about usage of register: R10 in 'UnsetPending'

      if (string.find)(l_0_13, "/proc/%*%*/environ") then
        l_0_15 = l_0_15 + 1
        if l_0_15 >= 2 then
          return mp.INFECTED
        end
      end
    end
    return mp.CLEAN
  end
end

