-- Threat: !InfrastructureShared
-- Name: !#Lua:AIModel:ScanTypes
-- Type: 12

local l_0_0 = mp.getfilename(mp.bitor(mp.FILEPATH_QUERY_FULL, mp.FILEPATH_QUERY_LOWERCASE))
if l_0_0:find("%-%>strings$") then
  mp.set_mpattribute("MpIsPKLStringScan")
elseif l_0_0:find("%-%>global$") then
  mp.set_mpattribute("MpIsPKLGlobalScan")
elseif l_0_0:find("%-%>chat_template$") then
  mp.set_mpattribute("MpIsGGUFChatTemplateScan")
elseif l_0_0:find("%-%>metadata$") and mp.get_mpattribute("Lua:ONNXExt") then
  mp.set_mpattribute("MpIsONNXMetadataScan")
elseif l_0_0:find("%-%>model_config$") then
  mp.set_mpattribute("MpIsH5ModelScan")
elseif l_0_0:find("%-%>config.json$") then
  mp.set_mpattribute("MpIsKerasScan")
end
return mp.CLEAN
