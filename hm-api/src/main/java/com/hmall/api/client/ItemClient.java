package com.hmall.api.client;

import com.hmall.api.client.fallback.ItemClientFallbackFactory;
import com.hmall.api.dto.ItemDTO;
import com.hmall.api.dto.OrderDetailDTO;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.Collection;
import java.util.List;

@FeignClient(value = "item-service",fallback = ItemClientFallbackFactory.class)
public interface ItemClient {
    @GetMapping("/items")
    public List<ItemDTO> queryItemByIds(@RequestParam("ids") Collection<Long> ids) ;

    @PutMapping(value = "/items/stock/deduct")
    public void deductStock(@RequestBody Collection<OrderDetailDTO> items);
}
