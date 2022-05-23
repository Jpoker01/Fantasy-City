#include "lumbermill.h"

LumberMill::LumberMill()
{
    m_cost[Resources::GOLD] = 200;
    m_cost[Resources::WOOD] = 0;
    m_productionType = Resources::WOOD;
    m_produced = 5;
}
