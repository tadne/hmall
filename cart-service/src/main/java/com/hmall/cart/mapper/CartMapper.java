package com.hmall.cart.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.hmall.cart.domain.po.Cart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

/**
 * <p>
 * 订单详情表 Mapper 接口
 * </p>
 */
@Mapper
public interface CartMapper extends BaseMapper<Cart> {

    @Update("UPDATE cart SET num = num + 1 WHERE user_id = #{userId} AND item_id = #{itemId}")
    void updateNum(@Param("itemId") Long itemId, @Param("userId") Long userId);
}
