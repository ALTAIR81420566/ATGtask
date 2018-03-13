package dynamusic;

/**
 * Created by Administrator on 3/13/2018.
 */
import atg.repository.*;

import java.util.Date;

public class FindAge extends RepositoryPropertyDescriptor{
    public static final String YEARS = "years";
    public static final String DAYS = "days";
    public static final String PROPERTY_NAME = "dateOfBirth";
    private String mAgeFormat = YEARS;
    public static final String AGE_FORMAT_ATTR_NAME = "ageFormat";

    @Override
    public void setValue(String pAttributeName, Object pValue) {
        if(pAttributeName != null && pAttributeName.equals(AGE_FORMAT_ATTR_NAME) && pValue != null) {
            mAgeFormat = pValue.toString();
        }
    }

    @Override
    public Object getPropertyValue(RepositoryItemImpl pItem, Object pValue) {
        Date date = (Date) pItem.getPropertyValue(PROPERTY_NAME);
        Object result = null;
        if(date != null) {
            if (mAgeFormat.equals(YEARS)) {
                result = new Integer(AgeCalc.ageInYears(date));
            } else if (mAgeFormat.equals(DAYS)) {
                result = new Integer(AgeCalc.ageInDays(date));
            }
        }
        return result;
    }

    @Override
    public boolean isQueryable() {
        return false;
    }

    @Override
    public boolean isWritable() {
        return false;
    }
}
