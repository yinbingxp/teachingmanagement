package springitem.teachingmanager.utils.ReturnResult;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * 带有数量的返回结果
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ResultWithTotal extends Result {
    Integer total;  //共计
}
