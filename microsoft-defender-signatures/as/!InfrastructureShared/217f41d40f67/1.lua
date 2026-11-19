-- Threat: !InfrastructureShared
-- Name: 217f41d40f67
-- Type: 21

pe.set_regval(pe.REG_EIP, pe.get_regval(pe.REG_EIP) + 31)
return mp.CLEAN
