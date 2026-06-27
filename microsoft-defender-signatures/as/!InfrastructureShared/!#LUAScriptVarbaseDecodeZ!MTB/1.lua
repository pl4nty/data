-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#LUAScriptVarbaseDecodeZ!MTB\1.luac 

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
    if not (string.match)(l_0_5, "::FromBase64String%s*%(%s*[\"\']%$%{([%w_]+)%}[\"\']%s*%)") then
      return mp.CLEAN
    end
    local l_0_11 = nil
    local l_0_12 = nil
    if (string.match)(l_0_11, "const%s+" .. (string.match)(l_0_5, "::FromBase64String%s*%(%s*[\"\']%$%{([%w_]+)%}[\"\']%s*%)") .. "%s*=%s*[\"\']([A-Za-z0-9+/=\r\n]+)[\"\']") == nil or #(string.match)(l_0_11, "const%s+" .. (string.match)(l_0_5, "::FromBase64String%s*%(%s*[\"\']%$%{([%w_]+)%}[\"\']%s*%)") .. "%s*=%s*[\"\']([A-Za-z0-9+/=\r\n]+)[\"\']") < 256 then
      return mp.CLEAN
    end
    local l_0_13 = nil
    if (MpCommon.Base64Decode)((string.match)(l_0_11, "const%s+" .. (string.match)(l_0_5, "::FromBase64String%s*%(%s*[\"\']%$%{([%w_]+)%}[\"\']%s*%)") .. "%s*=%s*[\"\']([A-Za-z0-9+/=\r\n]+)[\"\']")) == nil then
      return mp.CLEAN
    end
    ;
    (mp.vfo_add_buffer)((MpCommon.Base64Decode)((string.match)(l_0_11, "const%s+" .. (string.match)(l_0_5, "::FromBase64String%s*%(%s*[\"\']%$%{([%w_]+)%}[\"\']%s*%)") .. "%s*=%s*[\"\']([A-Za-z0-9+/=\r\n]+)[\"\']")), "[DecodedVFO]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.CLEAN
  end
end

