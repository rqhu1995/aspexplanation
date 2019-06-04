package com.seu.hrqnanjing.ASPParser;

import com.seu.hrqnanjing.ASPParser.LPMLNParser.TermContext;

import java.util.List;

/**
 * @author bobhu
 * 2018/12/19
 * function: single rule head/body/posBody/negBody extraction
 */
public class ASPRuleExtractor extends LPMLNBaseVisitor {

    private ASPRule ruleForParse = new ASPRule();

    //访问头部
    @Override
    public Object visitHead(LPMLNParser.HeadContext ctx) {
        List<LPMLNParser.LiteralContext> heads = ctx.literal();
        for (LPMLNParser.LiteralContext ctxs : heads) {
            String head = ctxs.getText();
            int idx = literalMapSet(head);
            ruleForParse.setHead(idx);
        }
        return super.visitHead(ctx);
    }


    public int literalMapSet(String literal) {
        int literalIdx;
        if (ruleForParse.getLiteralMap().containsKey(literal)) {
            literalIdx = ruleForParse.getLiteralMap().get(literal);
        } else {
            ruleForParse.getLiteralMap().put(literal, ruleForParse.getLiteralMap().size());
            ruleForParse.getLiteralReverseMap().put(ruleForParse.getLiteralMap().size() - 1, literal);
            literalIdx = ruleForParse.getLiteralMap().size() - 1;
        }

        return literalIdx;
    }


    @Override
    public Object visitAtom(LPMLNParser.AtomContext ctx) {
        for (TermContext termContext : ctx.term()) {
            if (termContext.CONSTANT() != null) {
                ruleForParse.setConstantList(termContext.CONSTANT().getText());
            }
            if (termContext.STRING()!=null){
                ruleForParse.setConstantList(termContext.STRING().getText());
            }
            if (termContext.VAR() != null) {
                ruleForParse.setVarList(termContext.VAR().getText());
            }
        }
        return super.visitAtom(ctx);
    }


    @Override
    public Object visitExtended_literal(LPMLNParser.Extended_literalContext ctx) {
        int litIdx;

        // 下方是正原子(extended不是pos就是neg）
        if (ctx.literal() != null) {
            litIdx = literalMapSet(ctx.literal().getText());
            ruleForParse.setPosbody(litIdx);
        } else {
            litIdx = literalMapSet(ctx.default_literal().literal().getText());
            ruleForParse.setNegbody(litIdx);
        }
        return super.visitExtended_literal(ctx);
    }

    @Override
    public Object visitBody_aggregate(LPMLNParser.Body_aggregateContext ctx) {
        if(ctx.aggregate_elements()!=null){
            System.out.println(ctx.getText());
        }
        return super.visitBody_aggregate(ctx);
    }


    @Override
    public Object visitLiteral(LPMLNParser.LiteralContext ctx) {
        int literalIdx;
        literalIdx = literalMapSet(ctx.getText());
        return super.visitLiteral(ctx);
    }

    @Override
    public Object visitRelation_expr(LPMLNParser.Relation_exprContext ctx) {
        if(ctx!=null){
            ruleForParse.setExpressionTable(ctx.getText());
        }
        return super.visitRelation_expr(ctx);
    }

    @Override
    public Object visitLpmln_rule(LPMLNParser.Lpmln_ruleContext ctx) {
        return super.visitLpmln_rule(ctx);
    }

    public ASPRule getRuleForParse() {
        ruleForParse.setRuleLiteralByPart();
        ruleForParse.setRuleType();
        return ruleForParse;
    }

}
